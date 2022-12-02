// *****************************************************************************************************************
// Filename    : UartTx.v
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
// Description : Uart Tx IP implementation
//
// *****************************************************************************************************************

module UartTx(Reset, Clk, Tx);
   
input Reset,Clk;
output reg Tx;

    /****************************************************/
    /* UART TX */
    /****************************************************/
    localparam CLK_RATE = 100000000; // 100MHz
    localparam SERIAL_BAUD_RATE = 115200;
    localparam UartTxCounterMax = $rtoi($ceil(CLK_RATE/SERIAL_BAUD_RATE));

    reg [7:0]  UartTxData = "A";
    reg [31:0] UartTxBaudCounter = 0;
    reg [7:0]  UartTxCurrentBitPosition = 0;
    reg        UartTxIsActive = 1;

    always @(posedge Clk or negedge Reset)
    begin
        if(!Reset)
            begin
                UartTxBaudCounter <= 0;
                Tx <= 1;
                UartTxCurrentBitPosition <= 0;
                UartTxIsActive <= 1;
            end
        else if(UartTxBaudCounter >= UartTxCounterMax)
            begin

                if(UartTxIsActive == 1)
                begin
                    case(UartTxCurrentBitPosition)
                        0: Tx <= 0; //Start bit
                        1: Tx <= UartTxData[UartTxCurrentBitPosition-1];
                        2: Tx <= UartTxData[UartTxCurrentBitPosition-1];
                        3: Tx <= UartTxData[UartTxCurrentBitPosition-1];
                        4: Tx <= UartTxData[UartTxCurrentBitPosition-1];
                        5: Tx <= UartTxData[UartTxCurrentBitPosition-1];
                        6: Tx <= UartTxData[UartTxCurrentBitPosition-1];
                        7: Tx <= UartTxData[UartTxCurrentBitPosition-1];
                        8: Tx <= UartTxData[UartTxCurrentBitPosition-1];
                        9: Tx <= 1; // Stop bit
                        default: Tx <= 1;
                    endcase

                    UartTxCurrentBitPosition <= UartTxCurrentBitPosition + 8'h1;

                    if (UartTxCurrentBitPosition > 9)
                    begin
                        UartTxIsActive <= 0;
                        UartTxCurrentBitPosition <= 0;
                    end

                end
                UartTxBaudCounter <= 32'h0;

            end
        else
            UartTxBaudCounter <= UartTxBaudCounter + 32'h1;

    end    
 
endmodule
