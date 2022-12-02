// *****************************************************************************************************************
// Filename    : bcd_counter.v
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
// Description : BCD counter IP implementation
//
// *****************************************************************************************************************

module bcd_counter(Reset, Clk, Sw, BCDCount);

    input Reset;
    input Clk;
    input [4:0] Sw;
    output reg [15:0] BCDCount;
    
    reg [15:0] _16bit_temp_bcd = 0;
    reg [31:0] counter = 0;
    reg [31:0] MaxCount = 9999_9999;

    /* endless loop */
    always @(posedge Clk or negedge Reset)
    begin
        if(!Reset)
            begin
                counter <= 0;
                _16bit_temp_bcd <= 0;
                BCDCount <= 0;
            end
        else if (Sw != 0)begin
          if(Sw[1] == 1)
           MaxCount <= 9999_9999;
          if(Sw[3] == 1)
           MaxCount <= 99_9999;
          if(Sw[4] == 1)
           MaxCount <= 999_9999;
        end            
        else if(counter >= MaxCount) begin

            _16bit_temp_bcd <= _16bit_temp_bcd + 16'h1;
            BCDCount <= _16bit_temp_bcd;
            counter <= 0;
        end
        else
            begin
                counter <= counter + 32'h1;

                if(_16bit_temp_bcd[3:0] > 9)
                    _16bit_temp_bcd <= _16bit_temp_bcd + 16'h6;

                if(_16bit_temp_bcd[7:4] > 9)
                    _16bit_temp_bcd <= _16bit_temp_bcd + 16'h60;

                if(_16bit_temp_bcd[11:8] > 9)
                    _16bit_temp_bcd <= _16bit_temp_bcd + 16'h600;

                if(_16bit_temp_bcd[15:12] > 9)
                    _16bit_temp_bcd <= _16bit_temp_bcd + 16'h6000;
            end

    end

endmodule
