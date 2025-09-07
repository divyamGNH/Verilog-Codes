module notGate(
    input a,
    output y
);

not(y,a);

endmodule

module tbNotGate;

reg A;
wire Y;

notGate uut (.a(A),.y(Y));

initial begin
    $display("A | Y");

    A = 0; #1 $display("%b | %b", A, Y);
    A = 1; #1 $display("%b | %b", A, Y);

    $finish;
    
end

endmodule