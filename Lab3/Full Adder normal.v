module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire t1, t2, t3;

    xor(t1, a, b);
    xor(sum, t1, cin);

    and(t2, a, b);
    and(t3, cin, t1);
    or(cout, t2, t3);

endmodule


module tb_full_adder;

    reg A, B, Cin;
    wire SUM, COUT;

    full_adder uut (.a(A), .b(B), .cin(Cin), .sum(SUM), .cout(COUT));

    initial begin
        $display("A B Cin | SUM COUT");

        A=0; B=0; Cin=0; #1 $display("%b %b  %b  |  %b    %b", A,B,Cin,SUM,COUT);
        A=0; B=0; Cin=1; #1 $display("%b %b  %b  |  %b    %b", A,B,Cin,SUM,COUT);
        A=0; B=1; Cin=0; #1 $display("%b %b  %b  |  %b    %b", A,B,Cin,SUM,COUT);
        A=0; B=1; Cin=1; #1 $display("%b %b  %b  |  %b    %b", A,B,Cin,SUM,COUT);
        A=1; B=0; Cin=0; #1 $display("%b %b  %b  |  %b    %b", A,B,Cin,SUM,COUT);
        A=1; B=0; Cin=1; #1 $display("%b %b  %b  |  %b    %b", A,B,Cin,SUM,COUT);
        A=1; B=1; Cin=0; #1 $display("%b %b  %b  |  %b    %b", A,B,Cin,SUM,COUT);
        A=1; B=1; Cin=1; #1 $display("%b %b  %b  |  %b    %b", A,B,Cin,SUM,COUT);

        $finish;
    end

endmodule
