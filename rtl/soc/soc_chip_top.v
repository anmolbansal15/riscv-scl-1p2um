module soc_chip_top #(
    parameter integer CLKS_PER_BIT = 87
)(
    input  wire clk,
    input  wire rst,
    input  wire uart_rx,
    output wire uart_tx
);

    // Internal debug signals
    wire [31:0] debug_pc;
    wire [31:0] debug_instruction;
    wire debug_illegal;
    wire debug_exception_valid;
    wire [31:0] debug_exception_cause;
    wire [31:0] debug_exception_pc;

    // Existing verified SoC
    soc_top #(
        .CLKS_PER_BIT(CLKS_PER_BIT)
    ) u_soc (
        .clk(clk),
        .rst(rst),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx),

        .debug_pc(debug_pc),
        .debug_instruction(debug_instruction),
        .debug_illegal(debug_illegal),

        .debug_exception_valid(debug_exception_valid),
        .debug_exception_cause(debug_exception_cause),
        .debug_exception_pc(debug_exception_pc)
    );

endmodule
