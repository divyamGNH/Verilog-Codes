module demux1to8_simple(
    input wire din,          // Single input
    input wire [2:0] sel,    // Select lines
    output wire [7:0] out    // 8 outputs
);

    assign out = din << sel;

endmodule

module tb_demux_simple;

    reg DIN;
    reg [2:0] SEL;
    wire [7:0] OUT;
    integer i;

    demux1to8_simple uut (.din(DIN), .sel(SEL), .out(OUT));

    initial begin
        $dumpfile("demux_simple.vcd");
        $dumpvars(0, tb_demux_simple);

        DIN = 1'b1;

        for (i = 0; i < 8; i = i + 1) begin
            SEL = i;
            #50;
        end

        #50;
        $finish;
    end

endmodule
