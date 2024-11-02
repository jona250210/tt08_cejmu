/*
 * Copyright (c) 2024 CEJMU
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none (* keep_hierarchy *) (* keep *)
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

  logic rst;
  logic bav0_out;

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out = {7'b0, bav0_out};

  assign rst = ~rst_n;

  // List all unused inputs to prevent warnings
  logic _unused = &{ena, 1'b0};

  baverage bav0 (
      .x  (ui_in[1:0]),
      .clk(clk),
      .rst(rst),
      .y  (bav0_out)
  );

endmodule
