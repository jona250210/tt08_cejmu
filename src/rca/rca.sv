module rca #(parameter WIDTH = 32)(
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,
    input logic [WIDTH-1:0] c_in,
    output logic [WIDTH:0]  s
);

    logic [WIDTH:0] cc_carry;
    genvar i;

    assign cc_carry[0] = 1`b0;

    generate
        for (i=0; i < WIDTH; i++) begin : generate_adder_modules
            rca_full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .ci_in(cc_carry[i]),
                .cout(cc_carry[i+1]),
                .s(s[i])
            );
        end
    endgenerate

`ifdef FORMAL
    always_comb begin
        addition: assert (z == a + b);
    end
`endif

endmodule 