module bcdadder(a,b,ci,s,co);
    input [3:0]a,b;
    input ci;
    output [3:0]s;
    output co;
    wire s3,s2,s1,s0,c3,c2,c1,c0;
    wire e3,e2,e1,e0;
    fa f0(a[0],b[0],ci,s0,c0);
    fa f1(a[1],b[1],c0,s1,c1);
    fa f2(a[2],b[2],c1,s2,c2);
    fa f3(a[3],b[3],c2,s3,c3);
    assign co=c3|(s3&s2)|(s3&s1);
    fa f11(s0,1'b0,1'b0,s[0],e0);
    fa f12(s1,co,e0,s[1],e1);
    fa f13(s2,co,e1,s[2],e2);
    fa f14(s3,1'b0,e2,s[3],e3);
endmodule 
