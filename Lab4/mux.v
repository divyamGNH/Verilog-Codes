module mux(
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);

assign y = sel ? b : a;

endmodule

module tb_mux;
    reg A, B, SEL;
    wire Y;

    mux uut (
        .a(A),
        .b(B),
        .sel(SEL),
        .y(Y)
    );

    initial begin
        $display("A B SEL | Y");
        A = 0; B = 0; SEL = 0; #1 $display("%b %b  %b  | %b", A, B, SEL, Y);
        A = 0; B = 1; SEL = 0; #1 $display("%b %b  %b  | %b", A, B, SEL, Y);
        A = 1; B = 0; SEL = 0; #1 $display("%b %b  %b  | %b", A, B, SEL, Y);
        A = 1; B = 1; SEL = 0; #1 $display("%b %b  %b  | %b", A, B, SEL, Y);

        A = 0; B = 0; SEL = 1; #1 $display("%b %b  %b  | %b", A, B, SEL, Y);
        A = 0; B = 1; SEL = 1; #1 $display("%b %b  %b  | %b", A, B, SEL, Y);
        A = 1; B = 0; SEL = 1; #1 $display("%b %b  %b  | %b", A, B, SEL, Y);
        A = 1; B = 1; SEL = 1; #1 $display("%b %b  %b  | %b", A, B, SEL, Y);

        $finish;
    end
endmodule