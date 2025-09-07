//AND from NAND

module jdoodle;
    reg A, B;
    wire Y, t;

    nand(t, A, B);       // first NAND
    nand(Y, t, t);       // NAND with itself -> AND

    initial begin
        $display("A B | Y");
        A=0; B=0; #1 $display("%b %b | %b", A, B, Y);
        A=0; B=1; #1 $display("%b %b | %b", A, B, Y);
        A=1; B=0; #1 $display("%b %b | %b", A, B, Y);
        A=1; B=1; #1 $display("%b %b | %b", A, B, Y);
        $finish;
    end
endmodule
