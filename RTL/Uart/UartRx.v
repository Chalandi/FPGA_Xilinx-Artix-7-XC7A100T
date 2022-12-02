// *****************************************************************************************************************
// Filename    : UartRx.v
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
// Description : Uart Rx IP implementation
//
// *****************************************************************************************************************

module UartRx(Reset, Clk, Rx, LLedEx);

    input Reset,Clk, Rx;
    output reg [23:0] LLedEx;

    /****************************************************/
    /* UART RX */
    /****************************************************/
    localparam CLK_RATE = 100000000; // 100MHz
    localparam SERIAL_BAUD_RATE = 115200;
    localparam UartRxCounterMax = $rtoi($ceil((CLK_RATE/SERIAL_BAUD_RATE))) - 10;    
    reg [7:0]  UartRxData = 0;
    reg [31:0] UartRxBaudCounter = 0;
    reg [7:0]  UartRxCurrentBitPosition = 0;
    reg        UartRxStartBitIsDetected = 0;
    reg        UartRxIdleIsDetected = 0;
    reg        UartRxStartbitValue = 0;
    reg        UartRxStopbitValue = 0;

    always @(posedge Clk or negedge Reset) begin

        LLedEx[16] <= Rx;

        if(!Reset) begin
            UartRxData <= 0;
            UartRxBaudCounter <= 0;
            UartRxCurrentBitPosition <= 0;
            UartRxStartBitIsDetected <= 0;
            UartRxIdleIsDetected <= 0;
            UartRxStartbitValue <= 0;
            UartRxStopbitValue <= 0;
            LLedEx <= 0;
        end
        else if(UartRxStartBitIsDetected == 1) begin
            if(UartRxBaudCounter >= UartRxCounterMax) begin

                case(UartRxCurrentBitPosition)
                    0: UartRxStartbitValue <= Rx;
                    1: UartRxData[UartRxCurrentBitPosition-1] <= Rx;
                    2: UartRxData[UartRxCurrentBitPosition-1] <= Rx;
                    3: UartRxData[UartRxCurrentBitPosition-1] <= Rx;
                    4: UartRxData[UartRxCurrentBitPosition-1] <= Rx;
                    5: UartRxData[UartRxCurrentBitPosition-1] <= Rx;
                    6: UartRxData[UartRxCurrentBitPosition-1] <= Rx;
                    7: UartRxData[UartRxCurrentBitPosition-1] <= Rx;
                    8: UartRxData[UartRxCurrentBitPosition-1] <= Rx;
                    9: UartRxStopbitValue <= Rx;
                endcase

                UartRxBaudCounter <= 0;
                UartRxCurrentBitPosition <= UartRxCurrentBitPosition + 8'h1;


                if((UartRxCurrentBitPosition > 9)) begin
                    LLedEx[0] <= UartRxStartbitValue;
                    LLedEx[1] <= UartRxData[0];
                    LLedEx[2] <= UartRxData[1];
                    LLedEx[3] <= UartRxData[2];
                    LLedEx[4] <= UartRxData[3];
                    LLedEx[5] <= UartRxData[4];
                    LLedEx[6] <= UartRxData[5];
                    LLedEx[7] <= UartRxData[6];
                    LLedEx[8] <= UartRxData[7];
                    LLedEx[9] <= UartRxStopbitValue;

                    UartRxStartBitIsDetected <= 0;
                    UartRxIdleIsDetected     <= 0;
                    UartRxCurrentBitPosition <= 0;
                end
            end
            else
                UartRxBaudCounter <= UartRxBaudCounter + 32'h1;
        end
        else if ((Rx == 1) && (UartRxIdleIsDetected == 0) && (UartRxCurrentBitPosition == 0))
            UartRxIdleIsDetected <= 1;

        else if ((Rx == 0) && (UartRxIdleIsDetected == 1) && (UartRxCurrentBitPosition == 0)) begin
            UartRxStartBitIsDetected <= 1;
            LLedEx[23] <= 1;
        end
    end

endmodule
