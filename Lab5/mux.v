module mux8to1_simple(
    input wire [7:0] in,
    input wire [2:0] sel,
    output wire y
);

    assign y = in[sel];

endmodule


module tb_mux_simple;

    reg [7:0] IN;
    reg [2:0] SEL;
    wire Y1;
    integer i;

    mux8to1_simple uut1 (.in(IN), .sel(SEL), .y(Y1));

    initial begin
        $dumpfile("mux_simple.vcd");
        $dumpvars(0, tb_mux_simple);

        IN = 8'b00000000;
        SEL = 0;
        #10;

        for (i = 0; i < 8; i = i + 1) begin
            IN = 8'b00000000;
            IN[i] = 1'b1;
            SEL = i;
            #50;
        end

        #50;
        $finish;
    end

endmodule
