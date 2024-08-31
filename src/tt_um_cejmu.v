/* Generated by Yosys 0.36 (git sha1 cc31c6e, g++ 12.2.0 -fstack-clash-protection -mtune=generic -O2 -ffile-prefix-map=/builddir/yosys-0.36=. -fPIC -Os) */

(* src = "baverage.sv:1.1-43.10" *)
module baverage(x, clk, rst, y);
  (* src = "baverage.sv:0.0-0.0" *)
  wire [31:0] _00_;
  (* src = "baverage.sv:12.5-17.8" *)
  wire [31:0] _01_;
  (* src = "baverage.sv:0.0-0.0" *)
  wire _02_;
  (* src = "baverage.sv:0.0-0.0" *)
  wire [31:0] _03_;
  (* src = "baverage.sv:0.0-0.0" *)
  wire _04_;
  (* src = "baverage.sv:0.0-0.0" *)
  wire [31:0] _05_;
  (* src = "baverage.sv:0.0-0.0" *)
  wire [31:0] _06_;
  (* src = "baverage.sv:0.0-0.0" *)
  wire [31:0] _07_;
  (* src = "baverage.sv:21.12-21.27" *)
  wire _08_;
  (* src = "baverage.sv:27.12-27.22" *)
  wire _09_;
  (* src = "baverage.sv:34.21-34.31" *)
  wire _10_;
  wire [31:0] _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire [31:0] _15_;
  wire _16_;
  wire [31:0] _17_;
  wire _18_;
  wire [31:0] _19_;
  wire _20_;
  wire [31:0] _21_;
  wire _22_;
  wire [31:0] _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire [31:0] _27_;
  wire _28_;
  wire [31:0] _29_;
  wire _30_;
  wire _31_;
  wire _32_;
  wire [31:0] _33_;
  wire _34_;
  (* src = "baverage.sv:3.21-3.24" *)
  input clk;
  wire clk;
  (* src = "baverage.sv:4.21-4.24" *)
  input rst;
  wire rst;
  (* enum_value_00000000000000000000000000000000 = "\\z0" *)
  (* enum_value_00000000000000000000000000000001 = "\\z50" *)
  (* enum_value_00000000000000000000000000000010 = "\\z100" *)
  (* enum_value_00000000000000000000000000000011 = "\\z150" *)
  (* src = "baverage.sv:9.13-9.20" *)
  (* wiretype = "\\mystate" *)
  wire [31:0] state_d;
  (* enum_value_00000000000000000000000000000000 = "\\z0" *)
  (* enum_value_00000000000000000000000000000001 = "\\z50" *)
  (* enum_value_00000000000000000000000000000010 = "\\z100" *)
  (* enum_value_00000000000000000000000000000011 = "\\z150" *)
  (* src = "baverage.sv:10.13-10.20" *)
  (* wiretype = "\\mystate" *)
  reg [31:0] state_q;
  (* src = "baverage.sv:2.27-2.28" *)
  input [1:0] x;
  wire [1:0] x;
  (* src = "baverage.sv:5.22-5.23" *)
  output y;
  wire y;
  assign _08_ = state_q == (* src = "baverage.sv:21.12-21.27" *) 32'd3;
  assign _09_ = x == (* src = "baverage.sv:27.12-27.22" *) 2'h1;
  assign _10_ = x == (* src = "baverage.sv:34.21-34.31" *) 2'h2;
  (* \always_ff  = 32'd1 *)
  (* src = "baverage.sv:12.5-17.8" *)
  always @(posedge clk)
    state_q <= _33_;
  function [31:0] _39_;
    input [31:0] a;
    input [95:0] b;
    input [2:0] s;
    (* full_case = 32'd1 *)
    (* src = "baverage.sv:0.0-0.0|baverage.sv:35.13-40.20" *)
    (* parallel_case *)
    casez (s)
      3'b??1:
        _39_ = b[31:0];
      3'b?1?:
        _39_ = b[63:32];
      3'b1??:
        _39_ = b[95:64];
      default:
        _39_ = a;
    endcase
  endfunction
  assign _11_ = _39_(state_q, 96'h000000020000000300000003, { _14_, _13_, _12_ });
  assign _12_ = state_q == (* full_case = 32'd1 *) (* src = "baverage.sv:0.0-0.0|baverage.sv:35.13-40.20" *) 32'd2;
  assign _13_ = state_q == (* full_case = 32'd1 *) (* src = "baverage.sv:0.0-0.0|baverage.sv:35.13-40.20" *) 32'd1;
  assign _14_ = ! (* full_case = 32'd1 *) (* src = "baverage.sv:0.0-0.0|baverage.sv:35.13-40.20" *) state_q;
  assign _15_ = _16_ ? (* full_case = 32'd1 *) (* src = "baverage.sv:34.21-34.31|baverage.sv:34.18-41.12" *) _11_ : 32'hxxxxxxxx;
  assign _17_ = _18_ ? (* full_case = 32'd1 *) (* src = "baverage.sv:27.12-27.22|baverage.sv:27.9-41.12" *) 32'hxxxxxxxx : _15_;
  assign _19_ = _20_ ? (* full_case = 32'd1 *) (* src = "baverage.sv:34.21-34.31|baverage.sv:34.18-41.12" *) _07_ : state_q;
  assign _21_ = _22_ ? (* full_case = 32'd1 *) (* src = "baverage.sv:27.12-27.22|baverage.sv:27.9-41.12" *) 32'hxxxxxxxx : _19_;
  function [31:0] _47_;
    input [31:0] a;
    input [95:0] b;
    input [2:0] s;
    (* full_case = 32'd1 *)
    (* src = "baverage.sv:0.0-0.0|baverage.sv:28.13-33.20" *)
    (* parallel_case *)
    casez (s)
      3'b??1:
        _47_ = b[31:0];
      3'b?1?:
        _47_ = b[63:32];
      3'b1??:
        _47_ = b[95:64];
      default:
        _47_ = a;
    endcase
  endfunction
  assign _23_ = _47_(state_q, 96'h000000010000000200000003, { _26_, _25_, _24_ });
  assign _24_ = state_q == (* full_case = 32'd1 *) (* src = "baverage.sv:0.0-0.0|baverage.sv:28.13-33.20" *) 32'd2;
  assign _25_ = state_q == (* full_case = 32'd1 *) (* src = "baverage.sv:0.0-0.0|baverage.sv:28.13-33.20" *) 32'd1;
  assign _26_ = ! (* full_case = 32'd1 *) (* src = "baverage.sv:0.0-0.0|baverage.sv:28.13-33.20" *) state_q;
  assign _27_ = _28_ ? (* full_case = 32'd1 *) (* src = "baverage.sv:27.12-27.22|baverage.sv:27.9-41.12" *) _23_ : 32'hxxxxxxxx;
  assign _29_ = _30_ ? (* full_case = 32'd1 *) (* src = "baverage.sv:27.12-27.22|baverage.sv:27.9-41.12" *) _05_ : _06_;
  assign _31_ = _32_ ? (* full_case = 32'd1 *) (* src = "baverage.sv:21.12-21.27|baverage.sv:21.9-22.19" *) 1'h1 : 1'h0;
  assign _33_ = _34_ ? (* full_case = 32'd1 *) (* src = "baverage.sv:13.13-13.16|baverage.sv:13.9-16.32" *) 32'd0 : state_d;
  assign _00_ = _03_;
  assign _02_ = _04_;
  assign _16_ = _10_;
  assign _18_ = _09_;
  assign _07_ = _17_;
  assign _20_ = _10_;
  assign _22_ = _09_;
  assign _06_ = _21_;
  assign _28_ = _09_;
  assign _05_ = _27_;
  assign _30_ = _09_;
  assign _03_ = _29_;
  assign _32_ = _08_;
  assign _04_ = _31_;
  assign _34_ = rst;
  assign _01_ = _33_;
  assign state_d = _29_;
  assign y = _31_;
endmodule

(* top =  1  *)
(* src = "tt_um_cejmu.sv:8.1-48.10" *)
module tt_um_cejmu(ui_in, uo_out, uio_in, uio_out, uio_oe, ena, clk, rst_n);
  (* src = "tt_um_cejmu.sv:39.11-39.45" *)
  wire _0_;
  (* src = "tt_um_cejmu.sv:0.0-0.0" *)
  wire [7:0] _1_;
  (* src = "tt_um_cejmu.sv:0.0-0.0" *)
  wire [7:0] _2_;
  (* src = "tt_um_cejmu.sv:36.18-36.24" *)
  wire _3_;
  wire [7:0] _4_;
  wire _5_;
  (* src = "tt_um_cejmu.sv:39.21-39.45" *)
  wire _6_;
  (* src = "tt_um_cejmu.sv:39.11-39.18" *)
  wire _unused;
  (* src = "tt_um_cejmu.sv:21.24-21.32" *)
  wire bav0_out;
  (* src = "tt_um_cejmu.sv:15.24-15.27" *)
  input clk;
  wire clk;
  (* src = "tt_um_cejmu.sv:14.24-14.27" *)
  input ena;
  wire ena;
  (* src = "tt_um_cejmu.sv:19.24-19.35" *)
  wire [7:0] project_mux;
  (* src = "tt_um_cejmu.sv:20.24-20.27" *)
  wire rst;
  (* src = "tt_um_cejmu.sv:16.24-16.29" *)
  input rst_n;
  wire rst_n;
  (* src = "tt_um_cejmu.sv:9.24-9.29" *)
  input [7:0] ui_in;
  wire [7:0] ui_in;
  (* src = "tt_um_cejmu.sv:11.24-11.30" *)
  input [7:0] uio_in;
  wire [7:0] uio_in;
  (* src = "tt_um_cejmu.sv:13.24-13.30" *)
  output [7:0] uio_oe;
  wire [7:0] uio_oe;
  (* src = "tt_um_cejmu.sv:12.24-12.31" *)
  output [7:0] uio_out;
  wire [7:0] uio_out;
  (* src = "tt_um_cejmu.sv:10.24-10.30" *)
  output [7:0] uo_out;
  wire [7:0] uo_out;
  assign _3_ = ! (* src = "tt_um_cejmu.sv:36.18-36.24" *) rst_n;
  assign _4_ = _5_ ? (* full_case = 32'd1 *) (* src = "tt_um_cejmu.sv:0.0-0.0|tt_um_cejmu.sv:24.9-29.16" *) { 7'h00, bav0_out } : ui_in;
  assign _5_ = ! (* full_case = 32'd1 *) (* src = "tt_um_cejmu.sv:0.0-0.0|tt_um_cejmu.sv:24.9-29.16" *) uio_in[1:0];
  (* module_not_derived = 32'd1 *)
  (* src = "tt_um_cejmu.sv:41.14-46.6" *)
  baverage bav0 (
    .clk(uio_in[7]),
    .rst(rst),
    .x(ui_in[1:0]),
    .y(bav0_out)
  );
  assign uo_out = project_mux;
  assign uio_out = 8'h00;
  assign uio_oe = 8'h00;
  assign rst = _3_;
  assign _0_ = _6_;
  assign _1_ = _2_;
  assign _2_ = _4_;
  assign _unused = _6_;
  assign project_mux = _4_;
  assign _6_ = 1'h0;
endmodule
