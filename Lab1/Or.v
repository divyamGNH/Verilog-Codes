module orGate(
    input a,
    input b,
    output y
);
    or (y ,a , b);

endmodule

module tbOrGate;
   reg A, B;
   wire Y;

   orGate uut ( .a(A), .b(B), .y(Y));

   initial begin
    $display("A B | Y");

    A = 0; B = 0; #1 $display("%b %b | %b", A, B, Y);
    A = 0; B = 1; #1 $display("%b %b | %b", A, B, Y);
    A = 1; B = 0; #1 $display("%b %b | %b", A, B, Y);
    A = 1; B = 1; #1 $display("%b %b | %b", A, B, Y);

    $finish;
   end
endmodule