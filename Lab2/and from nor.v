module andFromNor(
    input a,
    input b,
    output y
);

    wire nA, nB;

    nor(nA, a, a);
    nor(nB, b, b);
    nor(y, nA, nB);
    nor(y, y, y);

endmodule


module tb_andFromNor;

    reg A, B;
    wire Y;

    andFromNor uut (.a(A), .b(B), .y(Y));

    initial begin
        $display("A B | Y");
        A = 0; B = 0; #1 $display("%b %b | %b", A, B, Y);
        A = 0; B = 1; #1 $display("%b %b | %b", A, B, Y);
        A = 1; B = 0; #1 $display("%b %b | %b", A, B, Y);
        A = 1; B = 1; #1 $display("%b %b | %b", A, B, Y);
        $finish;
    end

endmodule
