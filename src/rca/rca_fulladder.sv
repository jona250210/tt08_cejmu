module rca_full_adder (
    input logic a,
    input logic b,
    input logic c_in,

    output logic s,
    output logic c_out
);

    assign s = a ^ b ^ ci; 
    assign c_out = a & b | c_in & (a ^ b);

endmodule

