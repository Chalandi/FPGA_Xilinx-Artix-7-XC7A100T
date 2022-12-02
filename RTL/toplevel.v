// *****************************************************************************************************************
// Filename    : toplevel.v
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
// Description : Toplevel design implementation
//
// *****************************************************************************************************************

module toplevel(S, DIP, LedEx, SEG, AN, reset, clk, led, usb_tx, usb_rx);

    input reset;
    input clk;
    output [7:0] led;
    output [3:0] AN;
    output [7:0] SEG;
    output [23:0] LedEx;
    input [23:0] DIP;
    input [4:0] S;
    input usb_rx;
    output usb_tx;

    wire [4:0] S_State;

    /* wire used to link output ref to input */
    wire [15:0] _16bit_bcd;

    assign S_State = ~S; //PRESSED: ~1, NON-PRESSED: ~0 (INTERNAL PULL-DOWN)

    /* instanciate the blinky module */
    blinky #(.FreqDivider(49990000)) LEDsCount(.Reset(reset), .Clk(clk), .Leds(led));

    /* instanciate the 7-segment module */
    _7segments SevenSegmentDriver(.Reset(reset), .Clk(clk), .Val(_16bit_bcd), .Seg(SEG), .Seg_En(AN));

    /* instanciate the bcd_counter module */
    bcd_counter BCDCounterRegister(.Reset(reset), .Clk(clk), .Sw(S), .BCDCount(_16bit_bcd));

    /* instanciate the uartcom module */
    UartCom Uart(.Reset(reset), .Clk(clk), .Tx(usb_tx), .Rx(usb_rx), .OutLed(LedEx));

endmodule
