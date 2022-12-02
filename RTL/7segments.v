// *****************************************************************************************************************
// Filename    : 7segments.v
//
// Author      : Chalandi Amine
//
// Owner       : Chalandi Amine
//
// FPGA board  : AlchitryAu+
//
// Device      : Xilinx Artix-7 XC7A100T FPGA
//
// Date        : 15/10/2022
//
// Description : Seven-segment display decoder IP implementation
//
// *****************************************************************************************************************

function [7:0] SevenSegmentDecoder(input [3:0] bcd_code);

`define    SEG_0    8'b11000000
`define    SEG_1    8'b11111001
`define    SEG_2    8'b10100100
`define    SEG_3    8'b10110000
`define    SEG_4    8'b10011001
`define    SEG_5    8'b10010010
`define    SEG_6    8'b10000010
`define    SEG_7    8'b11111000
`define    SEG_8    8'b10000000
`define    SEG_9    8'b10010000
`define    SEG_A    8'b10100000
`define    SEG_B    8'b10000011
`define    SEG_C    8'b11000110
`define    SEG_D    8'b10100001
`define    SEG_E    8'b10000110
`define    SEG_F    8'b10001110

    case(bcd_code)
        4'h0: SevenSegmentDecoder = `SEG_0;
        4'h1: SevenSegmentDecoder = `SEG_1;
        4'h2: SevenSegmentDecoder = `SEG_2;
        4'h3: SevenSegmentDecoder = `SEG_3;
        4'h4: SevenSegmentDecoder = `SEG_4;
        4'h5: SevenSegmentDecoder = `SEG_5;
        4'h6: SevenSegmentDecoder = `SEG_6;
        4'h7: SevenSegmentDecoder = `SEG_7;
        4'h8: SevenSegmentDecoder = `SEG_8;
        4'h9: SevenSegmentDecoder = `SEG_9;
        default: SevenSegmentDecoder = `SEG_9;
    endcase
endfunction

module _7segments(Reset, Clk, Val, Seg, Seg_En);

    input Reset;
    input Clk;
    input  [15:0] Val;
    output reg [3:0] Seg_En;
    output reg [7:0] Seg;

    /* local data */
    reg [31:0] counter = 0;
    reg       InternalClock = 0;

    /* list of parameters */
    localparam FreqDivider = 9_9999; //100MHz/200KHz => 500 Hz
    localparam SEVEN_SEG0 = 8'h0;
    localparam SEVEN_SEG1 = 8'h1;
    localparam SEVEN_SEG2 = 8'h2;
    localparam SEVEN_SEG3 = 8'h3;

    reg [7:0] current_seven_seg = SEVEN_SEG0;

    always @(posedge Clk or negedge Reset)
    begin
        if(!Reset)
            counter <= 0;

        else if(counter >= FreqDivider)
            begin
                InternalClock <= ~InternalClock;
                counter <= 0;
            end
        else
            counter <= counter + 32'h1;
    end

    always @(posedge InternalClock or negedge Reset)
    begin
        if(!Reset)
            begin
                Seg_En <= 4'b1111;
                Seg    <= 8'hff;
                current_seven_seg <= SEVEN_SEG0;
            end
        else
            case(current_seven_seg)
                SEVEN_SEG0:
                begin
                    Seg <= SevenSegmentDecoder(Val[3:0]);
                    Seg_En <= 4'b1110;
                    current_seven_seg <= SEVEN_SEG1;
                end
                SEVEN_SEG1:
                begin
                    if(Val[15:4] != 0) begin
                        Seg <= SevenSegmentDecoder(Val[7:4]);
                        Seg_En <= 4'b1101;
                        current_seven_seg <= SEVEN_SEG2;
                    end
                    else
                        current_seven_seg <= SEVEN_SEG0;
                end
                SEVEN_SEG2:
                begin
                    if(Val[15:8] != 0) begin
                        Seg <= SevenSegmentDecoder(Val[11:8]);
                        Seg_En <= 4'b1011;
                        current_seven_seg <= SEVEN_SEG3;
                    end
                    else
                        current_seven_seg <= SEVEN_SEG0;
                end
                SEVEN_SEG3:
                begin
                    if(Val[15:12] != 0) begin
                        Seg <= SevenSegmentDecoder(Val[15:12]);
                        Seg_En <= 4'b0111;
                        current_seven_seg <= SEVEN_SEG0;
                    end
                    else
                        current_seven_seg <= SEVEN_SEG0;
                end

            endcase
    end
endmodule
