module io_serdes_tb ();

    logic clk = 0;
    logic reset = 0;

    logic [7:0] inputs, outputs;
    logic [31:0] a, b, z;

    logic        start_calc = 0;
    logic        output_result = 0;

    io_serdes dut (
        .clk(clk),
        .reset(reset),
        .inputs(inputs),
        .outputs(outputs),
        .a(a),
        .b(b),
        .z(z),
        .start_calc(start_calc),
        .output_result(output_result)
    );

    always begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        $dumpfile("io_serdes.vcd");
        $dumpvars(0, dut);
        reset = 0;
        #3;
        reset = 1;

        // A
        inputs = 8'hDE;
        #2;
        inputs = 8'hAD;
        #2;
        inputs = 8'hBE;
        #2;
        inputs = 8'hEF;
        #2;

        // B
        inputs = 8'hAB;
        #2;
        inputs = 8'hCD;
        #2;
        inputs = 8'hEF;
        #2;
        inputs = 8'h12;
        #10; // Nothing should happen (state == IDLE)
        start_calc = 1'b1;
        #20; // Nothing
        z = 32'hABFF7892;

        #6;
        output_result = 1'b1;
        #20; // Should output and do nothing afterwards

        //assert(y==1) else $error("y not equal 1");
        $finish;
    end

endmodule // io_serdes_tb
