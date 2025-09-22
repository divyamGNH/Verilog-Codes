//gate level mux code 

module muxGL(
    input wire [7:0] in,
    input wire [2:0] sel,
    output wire y
);
    wire n0, n1, n2;
    wire [7:0] and_out;

    not (n0, sel[0]);
    not (n1, sel[1]);
    not (n2, sel[2]);

    and (and_out[0], in[0], n2, n1, n0);
    and (and_out[1], in[1], n2, n1, sel[0]);
    and (and_out[2], in[2], n2, sel[1], n0);
    and (and_out[3], in[3], n2, sel[1], sel[0]);
    and (and_out[4], in[4], sel[2], n1, n0);
    and (and_out[5], in[5], sel[2], n1, sel[0]);
    and (and_out[6], in[6], sel[2], sel[1], n0);
    and (and_out[7], in[7], sel[2], sel[1], sel[0]);

    or (y, and_out[0], and_out[1], and_out[2], and_out[3], and_out[4], and_out[5], and_out[6], and_out[7]);
endmodule


module tb_muxGL;

    reg [7:0] IN;
    reg [2:0] SEL;
    wire Y;

    muxGL uut (.in(IN), .sel(SEL), .y(Y));

    initial begin

        //gtk wave
        $dumpfile("muxGL.vcd");
        $dumpvars(0, tb_muxGL);

        IN = 8'b10101010;
        $display("Input is : %b", IN);

        $display("Selector | Y");

        SEL = 3'b000; #1 $display("%b | %b", SEL, Y);
        SEL = 3'b001; #1 $display("%b | %b", SEL, Y);
        SEL = 3'b010; #1 $display("%b | %b", SEL, Y);
        SEL = 3'b011; #1 $display("%b | %b", SEL, Y);
        SEL = 3'b100; #1 $display("%b | %b", SEL, Y);
        SEL = 3'b101; #1 $display("%b | %b", SEL, Y);
        SEL = 3'b110; #1 $display("%b | %b", SEL, Y);
        SEL = 3'b111; #1 $display("%b | %b", SEL, Y);
        
        $finish;
    end

endmodule