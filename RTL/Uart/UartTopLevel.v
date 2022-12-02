// *****************************************************************************************************************
// Filename    : UartTopLevel.v
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
// Description : Uart top level module implementation
//
// *****************************************************************************************************************

module UartCom(Reset, Clk, Tx, Rx, OutLed);

input Reset,Clk, Rx;
output Tx;
output [23:0] OutLed;



UartTx UartTxInst(Reset, Clk, Tx);
UartRx UartRxInst(Reset, Clk, Rx, OutLed);

endmodule
