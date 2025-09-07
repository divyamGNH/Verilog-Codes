module notFromNor(
    input a,
    output y
);

    nor(y, a, a);

endmodule


module tb_notFromNor;

    reg A;
    wire Y;

    notFromNor uut (.a(A), .y(Y));

    initial begin
        $display("A | Y");
        A = 0; #1 $display("%b | %b", A, Y);
        A = 1; #1 $display("%b | %b", A, Y);
        $finish;
    end

endmodule
