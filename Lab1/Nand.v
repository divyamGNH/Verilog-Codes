module nandGate (
    input  a,
    input  b,
    output y
);

    nand (y, a, b);

endmodule


module tbNandGate;

    reg A, B;   // test inputs
    wire Y;     // test output

    // Instantiate the AND gate (Unit Under Test)
    nandGate uut (
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
