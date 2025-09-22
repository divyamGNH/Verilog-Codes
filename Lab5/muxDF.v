//gate level mux code 

module muxGL(
    input wire [7:0] in,
    input wire [2:0] sel,
    output wire y
);

    assign y = (sel[2] == 0 && sel[1] == 0 && sel[0] == 0) ? in[0] :
               (sel[2] == 0 && sel[1] == 0 && sel[0] == 1) ? in[1] :
               (sel[2] == 0 && sel[1] == 1 && sel[0] == 0) ? in[2] :
               (sel[2] == 0 && sel[1] == 1 && sel[0] == 1) ? in[3] :
               (sel[2] == 1 && sel[1] == 0 && sel[0] == 0) ? in[4] :
               (sel[2] == 1 && sel[1] == 0 && sel[0] == 1) ? in[5] :
               (sel[2] == 1 && sel[1] == 1 && sel[0] == 0) ? in[6] :
                in[7]; 
endmodule


module tb_muxGL;

    reg [7:0] IN;
    reg [2:0] SEL;
    wire Y;

    muxGL uut (.in(IN), .sel(SEL), .y(Y));

    

    initial begin

        //gtk wave
        $dumpfile("demuxGL.vcd");
        $dumpvars(0, tb_demuxDF);

        IN = 8'b10101010;

        $display("Input is : %b", IN);

        $display("Selector | Y");

        SEL = 3'b000; #1 $display("   %b   | %b", SEL, Y);
        SEL = 3'b001; #1 $display("   %b   | %b", SEL, Y);
        SEL = 3'b010; #1 $display("   %b   | %b", SEL, Y);
        SEL = 3'b011; #1 $display("   %b   | %b", SEL, Y);
        SEL = 3'b100; #1 $display("   %b   | %b", SEL, Y);
        SEL = 3'b101; #1 $display("   %b   | %b", SEL, Y);
        SEL = 3'b110; #1 $display("   %b   | %b", SEL, Y);
        SEL = 3'b111; #1 $display("   %b   | %b", SEL, Y);
        
        $finish;
    end

    

endmodule