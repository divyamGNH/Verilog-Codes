module demux(
    input wire din,
    input wire sel,
    output wire y0,
    output wire y1
);

assign y0 = (~sel) ? din : 1'b0;
assign y1 = (sel)  ? din : 1'b0;

endmodule

module tb_demux;
    reg DIN, SEL;
    wire Y0, Y1;

    demux uut (
        .din(DIN),
        .sel(SEL),
        .y0(Y0),
        .y1(Y1)
    );

    initial begin
        $display("DIN SEL | Y0 Y1");
        DIN = 0; SEL = 0; #1 $display("%b   %b  | %b  %b", DIN, SEL, Y0, Y1);
        DIN = 1; SEL = 0; #1 $display("%b   %b  | %b  %b", DIN, SEL, Y0, Y1);
        DIN = 0; SEL = 1; #1 $display("%b   %b  | %b  %b", DIN, SEL, Y0, Y1);
        DIN = 1; SEL = 1; #1 $display("%b   %b  | %b  %b", DIN, SEL, Y0, Y1);
        $finish;
    end
endmodule