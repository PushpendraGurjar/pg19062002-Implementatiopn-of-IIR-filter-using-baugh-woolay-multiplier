`timescale 1ns / 1ps
module Baugh_Woolay_mult(x,y,p);
input[3:0]x,y;
output [7:0]p;

wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25;
supply1 one ;


 

assign p[0]=x[0]&y[0];

HA H10(x[1]&y[0],x[0]&y[1],p[1],t1);   
HA H11(x[2]&y[0],x[1]&y[1],t2,t3);   
HA H12(~(x[3]&y[0]),x[2]&y[1],t4,t5);   

FA H20(x[0]&y[2],t1,t2,p[2],t6); 
FA H21(x[1]&y[2],t3,t4,t7,t8); 
FA H22(~(x[3]&y[1]),x[2]&y[2],t5,t9,t10); 


FA H30(~(x[0]&y[3]),t6,t7,p[3],t11); 
FA H31(~(x[1]&y[3]),t8,t9,t12,t13); 
FA H32(~(x[3]&y[2]),~(x[2]&y[3]),t10 ,t14,t15); 



FA H40(one,t11,t12,p[4],t16); 
HA H41( t13,t14,t17,t18); 
HA H42(x[3]&y[3],t15 ,t19,t20); 


HA H50(t16,t17,p[5],t21); 
HA H51(t18, t19 ,t22 ,t23);

HA H60(t21,t22,p[6],t24); 

FA f(t23,t24,t20,p[7],t25);

endmodule
