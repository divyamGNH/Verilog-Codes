module half_adder(
    input a,
    input b,
    output sum,
    output carry
);

    xor(sum, a, b);

    and(carry, a, b);

endmodule


module tb_half_adder;

    reg A, B;
    wire SUM, CARRY;

    half_adder uut (.a(A), .b(B), .sum(SUM), .carry(CARRY));

    initial begin
        $display("A B | SUM CARRY");
        A = 0; B = 0; #1 $display("%b %b |  %b    %b", A, B, SUM, CARRY);
        A = 0; B = 1; #1 $display("%b %b |  %b    %b", A, B, SUM, CARRY);
        A = 1; B = 0; #1 $display("%b %b |  %b    %b", A, B, SUM, CARRY);
        A = 1; B = 1; #1 $display("%b %b |  %b    %b", A, B, SUM, CARRY);
        $finish;
    end

endmodule
