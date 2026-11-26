module inst_memory(
    input  [31:0] address,
    output [31:0] instruction
);

    reg [31:0] memory [0:255];

    // Fixed instruction ROM for tapeout
    initial begin
        $readmemh("programs/soc_uart_multi_rom.hex", memory);
    end

    // Word-aligned instruction fetch
    assign instruction = memory[address[9:2]];

endmodule

	 
