module clain8bitblocks(in0, in1, cin, G, P, s, cout, cbef);
    input [7:0] in0, in1;
    input cin;
    output G, P, cout, cbef;
    output [7:0] s;

    wire p0, p1, p2, p3, p4, p5, p6, p7;
    wire g0, g1, g2, g3, g4, g5, g6, g7;

    and AND0(g0, in0[0], in1[0]);
    and AND1(g1, in0[1], in1[1]);
    and AND2(g2, in0[2], in1[2]);
    and AND3(g3, in0[3], in1[3]);
    and AND4(g4, in0[4], in1[4]);
    and AND5(g5, in0[5], in1[5]);
    and AND6(g6, in0[6], in1[6]);
    and AND7(g7, in0[7], in1[7]);

    or OR0(p0, in0[0], in1[0]);
    or OR1(p1, in0[1], in1[1]);
    or OR2(p2, in0[2], in1[2]);
    or OR3(p3, in0[3], in1[3]);
    or OR4(p4, in0[4], in1[4]);
    or OR5(p5, in0[5], in1[5]);
    or OR6(p6, in0[6], in1[6]);
    or OR7(p7, in0[7], in1[7]);

    and ANDP(P, p7, p6, p5, p4, p3, p2, p1, p0);

    wire term1, term2, term3, term4, term5, term6, term7;
    and TERM1(term1, p7, g6);
    and TERM2(term2, p7, p6, g5);
    and TERM3(term3, p7, p6, p5, g4);
    and TERM4(term4, p7, p6, p5, p4, g3);
    and TERM5(term5, p7, p6, p5, p4, p3, g2);
    and TERM6(term6, p7, p6, p5, p4, p3, p2, g1);
    and TERM7(term7, p7, p6, p5, p4, p3, p2, p1, g0);

    or ORG(G, g7, term1, term2, term3, term4, term5, term6, term7);

    wire Pc;

    and PARTOFCOUT(Pc, P, cin);
    or COUT(cout, G, Pc);

    wire c1, c2, c3, c4, c5, c6, c7;
    wire c1inter;
    and ANDC1(c1inter, p0, cin);
    or ORC1(c1, c1inter, g0);

    wire c2inter, c22inter;
    and ANDC2(c2inter, p1, c1inter);
    and ANDC22(c22inter, p1, g0);
    or ORC2(c2, c2inter, c22inter, g1);

    wire c3inter, c33inter, c333inter;
    and ANDC3(c3inter, p2, c2inter);
    and ANDC33(c33inter, p2, c22inter);
    and ANDC333(c333inter, p2, g1);
    or ORC3(c3, g2, c333inter, c33inter, c3inter);

    wire c4inter, c44inter, c444inter, c4444inter;
    and ANDC4(c4inter, p3, c3inter);
    and ANDC44(c44inter, p3, c33inter);
    and ANDC444(c444inter, p3, c333inter);
    and ANDC4444(c4444inter, p3, g2);
    or ORC4(c4, g3, c4444inter, c444inter, c44inter, c4inter);

    wire c5inter, c55inter, c555inter, c5555inter, c55555inter;
    and ANDC5(c5inter, p4, c4inter);
    and ANDC55(c55inter, p4, c44inter);
    and ANDC555(c555inter, p4, c444inter);
    and ANDC5555(c5555inter, p4, c4444inter);
    and ANDC55555(c55555inter, p4, g3);
    or ORC5(c5, g4, c55555inter, c5555inter, c555inter, c55inter, c5inter);

    wire c6inter, c66inter, c666inter, c6666inter, c66666inter, c666666inter;
    and ANDC6(c6inter, p5, c5inter);
    and ANDC66(c66inter, p5, c55inter);
    and ANDC666(c666inter, p5, c555inter);
    and ANDC6666(c6666inter, p5, c5555inter);
    and ANDC66666(c66666inter, p5, c55555inter);
    and ANDC666666(c666666inter, p5, g4);
    or ORC6(c6, g5, c666666inter, c66666inter, c6666inter, c666inter, c66inter, c6inter);

    wire c7inter, c77inter, c777inter, c7777inter, c77777inter, c777777inter, c7777777inter;
    and ANDC7(c7inter, p6, c6inter);
    and ANDC77(c77inter, p6, c66inter);
    and ANDC777(c777inter, p6, c666inter);
    and ANDC7777(c7777inter, p6, c6666inter);
    and ANDC77777(c77777inter, p6, c66666inter);
    and ANDC777777(c777777inter, p6, c666666inter);
    and ANDC7777777(c7777777inter, p6, g5);
    or ORC7(c7, g6, c7777777inter, c777777inter, c77777inter, c7777inter, c777inter, c77inter, c7inter);

    xor XORS0(s[0], in1[0], in0[0], cin);
    xor XORS1(s[1], in0[1], in1[1], c1);
    xor XORS2(s[2], in0[2], in1[2], c2);
    xor XORS3(s[3], in0[3], in1[3], c3);
    xor XORS4(s[4], in0[4], in1[4], c4);
    xor XORS5(s[5], in0[5], in1[5], c5);
    xor XORS6(s[6], in0[6], in1[6], c6);
    xor XORS7(s[7], in0[7], in1[7], c7);

    assign cbef = c7;


endmodule