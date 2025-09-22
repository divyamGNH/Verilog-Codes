//gate level demux code 

module demuxGL(
    input wire in,
    input wire [2:0] sel,
    output wire [7:0] out
);
    wire n0, n1, n2;

    not (n0, sel[0]);
    not (n1, sel[1]);
    not (n2, sel[2]);

    and (out[0], in, n2, n1, n0);
    and (out[1], in, n2, n1, sel[0]);
    and (out[2], in, n2, sel[1], n0);
    and (out[3], in, n2, sel[1], sel[0]);
    and (out[4], in, sel[2], n1, n0);
    and (out[5], in, sel[2], n1, sel[0]);
    and (out[6], in, sel[2], sel[1], n0);
    and (out[7], in, sel[2], sel[1], sel[0]);

endmodule


module tb_demuxGL;

    reg IN;
    reg [2:0] SEL;
    wire [7:0] OUT;

    demuxGL uut (.in(IN), .sel(SEL), .out(OUT));

    initial begin

        //gtk wave
        $dumpfile("demuxGL.vcd");
        $dumpvars(0, tb_demuxDF);
        
        $display("Testing 1-to-8 Demultiplexer");
        $display("IN | SEL | OUT");
        
        //Show outputs for input = 0
        IN = 0;
        SEL = 3'b000; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b001; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b010; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b011; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        
        $display("");

        
        IN = 1;
        SEL = 3'b000; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b001; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b010; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b011; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b100; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b101; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b110; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        SEL = 3'b111; #1 $display(" %b |%b| %b", IN, SEL, OUT);
        
        $finish;
    end

endmodule