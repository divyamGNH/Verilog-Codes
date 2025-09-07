module andGate (
    input  a,
    input  b,
    output y
);

    assign y = a&b;

endmodule


module tb_andGate;

    reg A, B;   // test inputs
    wire Y;     // test output

    // Instantiate the AND gate (Unit Under Test)
    andGate uut (
        .a(A),
        .b(B),
        .y(Y)
    );

    initial begin
        $display("A B | Y");  // header

        A = 0; B = 0; #1 $display("%b %b | %b", A, B, Y);
        A = 0; B = 1; #1 $display("%b %b | %b", A, B, Y);
        A = 1; B = 0; #1 $display("%b %b | %b", A, B, Y);
        A = 1; B = 1; #1 $display("%b %b | %b", A, B, Y);

        $finish;
    end

endmodule
