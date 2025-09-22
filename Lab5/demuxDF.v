//dataflow demux code

module demuxDF(
    input wire in,
    input wire [2:0] sel,
    output wire [7:0] out
);

    assign out[0] = (sel[2] == 0 && sel[1] == 0 && sel[0] == 0) ? in : 1'b0;
    assign out[1] = (sel[2] == 0 && sel[1] == 0 && sel[0] == 1) ? in : 1'b0;
    assign out[2] = (sel[2] == 0 && sel[1] == 1 && sel[0] == 0) ? in : 1'b0;
    assign out[3] = (sel[2] == 0 && sel[1] == 1 && sel[0] == 1) ? in : 1'b0;
    assign out[4] = (sel[2] == 1 && sel[1] == 0 && sel[0] == 0) ? in : 1'b0;
    assign out[5] = (sel[2] == 1 && sel[1] == 0 && sel[0] == 1) ? in : 1'b0;
    assign out[6] = (sel[2] == 1 && sel[1] == 1 && sel[0] == 0) ? in : 1'b0;
    assign out[7] = (sel[2] == 1 && sel[1] == 1 && sel[0] == 1) ? in : 1'b0;

endmodule


module tb_demuxDF;

    reg IN;
    reg [2:0] SEL;
    wire [7:0] OUT;

    demuxDF uut (.in(IN), .sel(SEL), .out(OUT));

    initial begin

        //gtk wave
        $dumpfile("demuxGL.vcd");
        $dumpvars(0, tb_demuxDF);

        IN = 1'b1;
        
        $display("Input is : %b", IN);

        $display("Selector | OUT");

        SEL = 3'b000; #1 $display("   %b   | %b", SEL, OUT);
        SEL = 3'b001; #1 $display("   %b   | %b", SEL, OUT);
        SEL = 3'b010; #1 $display("   %b   | %b", SEL, OUT);
        SEL = 3'b011; #1 $display("   %b   | %b", SEL, OUT);
        SEL = 3'b100; #1 $display("   %b   | %b", SEL, OUT);
        SEL = 3'b101; #1 $display("   %b   | %b", SEL, OUT);
        SEL = 3'b110; #1 $display("   %b   | %b", SEL, OUT);
        SEL = 3'b111; #1 $display("   %b   | %b", SEL, OUT);
        
        $finish;
    end

endmodule