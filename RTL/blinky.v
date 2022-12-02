// *****************************************************************************************************************
// Filename    : blinky.v
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
// Description : LED driver IP implementation
//
// *****************************************************************************************************************

module blinky(Reset, Clk, Leds);

    input Reset;
    input Clk;
    output reg [7:0] Leds;

    reg [31:0] counter = 0;

    reg       InternalClock = 0;

    /* list of parameters */
    parameter FreqDivider = 4999_9999;


    initial begin
        Leds <= {8'h0};
    end

    /* endless loop */
    always @(posedge Clk or negedge Reset)
    begin
        if(!Reset)
            counter <= 0;

        else if(counter >= FreqDivider) begin
            counter <= 0;
            InternalClock <= ~InternalClock;
            end
        else
            counter <= counter + 32'h1;
    end

    /* Counter */
    always @(posedge InternalClock or negedge Reset)
    begin
        if(!Reset)
            Leds <= 0;
        else
            Leds <= Leds + 8'h1;
    end

endmodule

