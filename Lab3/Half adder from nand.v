module half_adder_nand(
    input a,
    input b,
    output sum,
    output carry
);

    wire t1, t2, t3;

    nand(carry, a, b);

    nand(t1, a, b);
    nand(t2, a, t1);
    nand(t3, b, t1);
    nand(sum, t2, t3);

    nand(carry, t1, t1); 

endmodule


module tb_half_adder_nand;

    reg A, B;
    wire SUM, CARRY;

    half_adder_nand uut (.a(A), .b(B), .sum(SUM), .carry(CARRY));

    initial begin
        $display("A B | SUM CARRY");
        A = 0; B = 0; #1 $display("%b %b |  %b    %b", A, B, SUM, CARRY);
        A = 0; B = 1; #1 $display("%b %b |  %b    %b", A, B, SUM, CARRY);
        A = 1; B = 0; #1 $display("%b %b |  %b    %b", A, B, SUM, CARRY);
        A = 1; B = 1; #1 $display("%b %b |  %b    %b", A, B, SUM, CARRY);
        $finish;
    end

endmodule
