module tt_um_CPU(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


wire reset; 
assign uio_oe = 8'b1111_1111 ; 
assign reset   = ~rst_n; 
CPU CPU8BIT(.clk(clk),
    .reset(reset), 
    .address(uio_out[7:1]), 
    .data_in(ui_in), 
    .data_out(uo_out), 
    .write(uio_out[0])
    );




endmodule