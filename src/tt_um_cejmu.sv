/*
 * Copyright (c) 2024 CEJMU
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_cejmu (
    input  logic [7:0] ui_in,    // Dedicated inputs
    output logic [7:0] uo_out,   // Dedicated outputs
    input  logic [7:0] uio_in,   // IOs: Input path
    output logic [7:0] uio_out,  // IOs: Output path
    output logic [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  logic       ena,      // always 1 when the design is powered, so you can ignore it
    input  logic       clk,      // clock
    input  logic       rst_n     // reset_n - low to reset
);

    logic [7:0]        project_mux;
    logic              rst;
    logic              bav0_out;

    always_comb begin
        case(uio_in[1:0]) // Multiplexer for submodule outputs
          2'b00: project_mux = {7'b0, bav0_out};
          // 2'b01: project_mux = ui_in + ui_in;

          default: project_mux = ui_in;
        endcase;
    end

    // All output pins must be assigned. If not used, assign to 0.
    assign uo_out  = project_mux;
    assign uio_out = 0;
    assign uio_oe  = 8'b00000000;
    assign rst = !rst_n;

    // List all unused inputs to prevent warnings
    logic _unused = &{ena, clk, rst_n, 1'b0};

    baverage bav0 (
        .x(ui_in[1:0]),
        .clk(uio_in[7]),
        .rst(rst),
        .y(bav0_out)
    );

endmodule
