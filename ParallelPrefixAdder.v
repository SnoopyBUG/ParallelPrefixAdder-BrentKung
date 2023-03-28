`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/24 09:26:11
// Design Name: 
// Module Name: ParallelPrefixAdder-BKA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BKA (
    input [63:0] a, b,
    input cin,
    output [63:0] s,
    output cout
    );


genvar i;

// T=0
wire [63:0] g, p;
assign g = a & b;
assign p = a ^ b;

// T=1
wire [31:0] g_1, p_1;
generate
    for (i=0; i<32; i=i+1) begin
        black black1(
            .g1(g[i*2]),
            .p1(p[i*2]),
            .g2(g[i*2+1]),
            .p2(p[i*2+1]),
            .gout(g_1[i]),
            .pout(p_1[i])
        );
    end
endgenerate

// T=2
wire [15:0] g_2, p_2;
generate
    for (i=0; i<16; i=i+1) begin
        black black2(
            .g1(g_1[i*2]),
            .p1(p_1[i*2]),
            .g2(g_1[i*2+1]),
            .p2(p_1[i*2+1]),
            .gout(g_2[i]),
            .pout(p_2[i])
        );
    end
endgenerate

// T=3
wire [7:0] g_3, p_3;
generate
    for (i=0; i<8; i=i+1) begin
        black black3(
            .g1(g_2[i*2]),
            .p1(p_2[i*2]),
            .g2(g_2[i*2+1]),
            .p2(p_2[i*2+1]),
            .gout(g_3[i]),
            .pout(p_3[i])
        );
    end
endgenerate

// T=4
wire [3:0] g_4, p_4;
generate
    for (i=0; i<4; i=i+1) begin
        black black4(
            .g1(g_3[i*2]),
            .p1(p_3[i*2]),
            .g2(g_3[i*2+1]),
            .p2(p_3[i*2+1]),
            .gout(g_4[i]),
            .pout(p_4[i])
        );
    end
endgenerate

// T=5
wire [1:0] g_5, p_5;
generate
    for (i=0; i<2; i=i+1) begin
        black black5(
            .g1(g_4[i*2]),
            .p1(p_4[i*2]),
            .g2(g_4[i*2+1]),
            .p2(p_4[i*2+1]),
            .gout(g_5[i]),
            .pout(p_5[i])
        );
    end
endgenerate

// T=6
wire g_6, p_6;
black black6(
    .g1(g_5[0]),
    .p1(p_5[0]),
    .g2(g_5[1]),
    .p2(p_5[1]),
    .gout(g_6),
    .pout(p_6)
);

// T=7
wire g_7, p_7;
black black7(
    .g1(g_5[0]),
    .p1(p_5[0]),
    .g2(g_4[2]),
    .p2(p_4[2]),
    .gout(g_7),
    .pout(p_7)
);

// T=8
wire [2:0] g_8, p_8;
black black8_1(
    .g1(g_4[0]),
    .p1(p_4[0]),
    .g2(g_3[2]),
    .p2(p_3[2]),
    .gout(g_8[0]),
    .pout(p_8[0])
);
black black8_2(
    .g1(g_5[0]),
    .p1(p_5[0]),
    .g2(g_3[4]),
    .p2(p_3[4]),
    .gout(g_8[1]),
    .pout(p_8[1])
);
black black8_3(
    .g1(g_7),
    .p1(p_7),
    .g2(g_3[6]),
    .p2(p_3[6]),
    .gout(g_8[2]),
    .pout(p_8[2])
);

// T=9
wire [6:0] g_9, p_9;
black black9_1(
    .g1(g_3[0]),
    .p1(p_3[0]),
    .g2(g_2[2]),
    .p2(p_2[2]),
    .gout(g_9[0]),
    .pout(p_9[0])
);
black black9_2(
    .g1(g_4[0]),
    .p1(p_4[0]),
    .g2(g_2[4]),
    .p2(p_2[4]),
    .gout(g_9[1]),
    .pout(p_9[1])
);
black black9_3(
    .g1(g_8[0]),
    .p1(p_8[0]),
    .g2(g_2[6]),
    .p2(p_2[6]),
    .gout(g_9[2]),
    .pout(p_9[2])
);
black black9_4(
    .g1(g_5[0]),
    .p1(p_5[0]),
    .g2(g_2[8]),
    .p2(p_2[8]),
    .gout(g_9[3]),
    .pout(p_9[3])
);
black black9_5(
    .g1(g_8[1]),
    .p1(p_8[1]),
    .g2(g_2[10]),
    .p2(p_2[10]),
    .gout(g_9[4]),
    .pout(p_9[4])
);
black black9_6(
    .g1(g_7),
    .p1(p_7),
    .g2(g_2[12]),
    .p2(p_2[12]),
    .gout(g_9[5]),
    .pout(p_9[5])
);
black black9_7(
    .g1(g_8[2]),
    .p1(p_8[2]),
    .g2(g_2[14]),
    .p2(p_2[14]),
    .gout(g_9[6]),
    .pout(p_9[6])
);

// T=10
wire [14:0] g_10, p_10;
black black10_1(
    .g1(g_2[0]),
    .p1(p_2[0]),
    .g2(g_1[2]),
    .p2(p_1[2]),
    .gout(g_10[0]),
    .pout(p_10[0])
);
black black10_2(
    .g1(g_3[0]),
    .p1(p_3[0]),
    .g2(g_1[4]),
    .p2(p_1[4]),
    .gout(g_10[1]),
    .pout(p_10[1])
);
black black10_3(
    .g1(g_9[0]),
    .p1(p_9[0]),
    .g2(g_1[6]),
    .p2(p_1[6]),
    .gout(g_10[2]),
    .pout(p_10[2])
);
black black10_4(
    .g1(g_4[0]),
    .p1(p_4[0]),
    .g2(g_1[8]),
    .p2(p_1[8]),
    .gout(g_10[3]),
    .pout(p_10[3])
);
black black10_5(
    .g1(g_9[1]),
    .p1(p_9[1]),
    .g2(g_1[10]),
    .p2(p_1[10]),
    .gout(g_10[4]),
    .pout(p_10[4])
);
black black10_6(
    .g1(g_8[0]),
    .p1(p_8[0]),
    .g2(g_1[12]),
    .p2(p_1[12]),
    .gout(g_10[5]),
    .pout(p_10[5])
);
black black10_7(
    .g1(g_9[2]),
    .p1(p_9[2]),
    .g2(g_1[14]),
    .p2(p_1[14]),
    .gout(g_10[6]),
    .pout(p_10[6])
);
black black10_8(
    .g1(g_5[0]),
    .p1(p_5[0]),
    .g2(g_1[16]),
    .p2(p_1[16]),
    .gout(g_10[7]),
    .pout(p_10[7])
);
black black10_9(
    .g1(g_9[3]),
    .p1(p_9[3]),
    .g2(g_1[18]),
    .p2(p_1[18]),
    .gout(g_10[8]),
    .pout(p_10[8])
);
black black10_10(
    .g1(g_8[1]),
    .p1(p_8[1]),
    .g2(g_1[20]),
    .p2(p_1[20]),
    .gout(g_10[9]),
    .pout(p_10[9])
);
black black10_11(
    .g1(g_9[4]),
    .p1(p_9[4]),
    .g2(g_1[22]),
    .p2(p_1[22]),
    .gout(g_10[10]),
    .pout(p_10[10])
);
black black10_12(
    .g1(g_7),
    .p1(p_7),
    .g2(g_1[24]),
    .p2(p_1[24]),
    .gout(g_10[11]),
    .pout(p_10[11])
);
black black10_13(
    .g1(g_9[5]),
    .p1(p_9[5]),
    .g2(g_1[26]),
    .p2(p_1[26]),
    .gout(g_10[12]),
    .pout(p_10[12])
);
black black10_14(
    .g1(g_8[2]),
    .p1(p_8[2]),
    .g2(g_1[28]),
    .p2(p_1[28]),
    .gout(g_10[13]),
    .pout(p_10[13])
);
black black10_15(
    .g1(g_9[6]),
    .p1(p_9[6]),
    .g2(g_1[30]),
    .p2(p_1[30]),
    .gout(g_10[14]),
    .pout(p_10[14])
);

// T=11
wire [30:0] g_11, p_11;
black black11_1(
    .g1(g_1[0]),
    .p1(p_1[0]),
    .g2(g[2]),
    .p2(p[2]),
    .gout(g_11[0]),
    .pout(p_11[0])
);
black black11_2(
    .g1(g_2[0]),
    .p1(p_2[0]),
    .g2(g[4]),
    .p2(p[4]),
    .gout(g_11[1]),
    .pout(p_11[1])
);
black black11_3(
    .g1(g_10[0]),
    .p1(p_10[0]),
    .g2(g[6]),
    .p2(p[6]),
    .gout(g_11[2]),
    .pout(p_11[2])
);
black black11_4(
    .g1(g_3[0]),
    .p1(p_3[0]),
    .g2(g[8]),
    .p2(p[8]),
    .gout(g_11[3]),
    .pout(p_11[3])
);
black black11_5(
    .g1(g_10[1]),
    .p1(p_10[1]),
    .g2(g[10]),
    .p2(p[10]),
    .gout(g_11[4]),
    .pout(p_11[4])
);
black black11_6(
    .g1(g_9[0]),
    .p1(p_9[0]),
    .g2(g[12]),
    .p2(p[12]),
    .gout(g_11[5]),
    .pout(p_11[5])
);
black black11_7(
    .g1(g_10[2]),
    .p1(p_10[2]),
    .g2(g[14]),
    .p2(p[14]),
    .gout(g_11[6]),
    .pout(p_11[6])
);
black black11_8(
    .g1(g_4[0]),
    .p1(p_4[0]),
    .g2(g[16]),
    .p2(p[16]),
    .gout(g_11[7]),
    .pout(p_11[7])
);
black black11_9(
    .g1(g_10[3]),
    .p1(p_10[3]),
    .g2(g[18]),
    .p2(p[18]),
    .gout(g_11[8]),
    .pout(p_11[8])
);
black black11_10(
    .g1(g_9[1]),
    .p1(p_9[1]),
    .g2(g[20]),
    .p2(p[20]),
    .gout(g_11[9]),
    .pout(p_11[9])
);
black black11_11(
    .g1(g_10[4]),
    .p1(p_10[4]),
    .g2(g[22]),
    .p2(p[22]),
    .gout(g_11[10]),
    .pout(p_11[10])
);
black black11_12(
    .g1(g_8[0]),
    .p1(p_8[0]),
    .g2(g[24]),
    .p2(p[24]),
    .gout(g_11[11]),
    .pout(p_11[11])
);
black black11_13(
    .g1(g_10[5]),
    .p1(p_10[5]),
    .g2(g[26]),
    .p2(p[26]),
    .gout(g_11[12]),
    .pout(p_11[12])
);
black black11_14(
    .g1(g_9[2]),
    .p1(p_9[2]),
    .g2(g[28]),
    .p2(p[28]),
    .gout(g_11[13]),
    .pout(p_11[13])
);
black black11_15(
    .g1(g_10[6]),
    .p1(p_10[6]),
    .g2(g[30]),
    .p2(p[30]),
    .gout(g_11[14]),
    .pout(p_11[14])
);
black black11_16(
    .g1(g_5[0]),
    .p1(p_5[0]),
    .g2(g[32]),
    .p2(p[32]),
    .gout(g_11[15]),
    .pout(p_11[15])
);
black black11_17(
    .g1(g_10[7]),
    .p1(p_10[7]),
    .g2(g[34]),
    .p2(p[34]),
    .gout(g_11[16]),
    .pout(p_11[16])
);
black black11_18(
    .g1(g_9[3]),
    .p1(p_9[3]),
    .g2(g[36]),
    .p2(p[36]),
    .gout(g_11[17]),
    .pout(p_11[17])
);
black black11_19(
    .g1(g_10[8]),
    .p1(p_10[8]),
    .g2(g[38]),
    .p2(p[38]),
    .gout(g_11[18]),
    .pout(p_11[18])
);
black black11_20(
    .g1(g_8[1]),
    .p1(p_8[1]),
    .g2(g[40]),
    .p2(p[40]),
    .gout(g_11[19]),
    .pout(p_11[19])
);
black black11_21(
    .g1(g_10[9]),
    .p1(p_10[9]),
    .g2(g[42]),
    .p2(p[42]),
    .gout(g_11[20]),
    .pout(p_11[20])
);
black black11_22(
    .g1(g_9[4]),
    .p1(p_9[4]),
    .g2(g[44]),
    .p2(p[44]),
    .gout(g_11[21]),
    .pout(p_11[21])
);
black black11_23(
    .g1(g_10[10]),
    .p1(p_10[10]),
    .g2(g[46]),
    .p2(p[46]),
    .gout(g_11[22]),
    .pout(p_11[22])
);
black black11_24(
    .g1(g_7),
    .p1(p_7),
    .g2(g[48]),
    .p2(p[48]),
    .gout(g_11[23]),
    .pout(p_11[23])
);
black black11_25(
    .g1(g_10[11]),
    .p1(p_10[11]),
    .g2(g[50]),
    .p2(p[50]),
    .gout(g_11[24]),
    .pout(p_11[24])
);
black black11_26(
    .g1(g_9[5]),
    .p1(p_9[5]),
    .g2(g[52]),
    .p2(p[52]),
    .gout(g_11[25]),
    .pout(p_11[25])
);
black black11_27(
    .g1(g_10[12]),
    .p1(p_10[12]),
    .g2(g[54]),
    .p2(p[54]),
    .gout(g_11[26]),
    .pout(p_11[26])
);
black black11_28(
    .g1(g_8[2]),
    .p1(p_8[2]),
    .g2(g[56]),
    .p2(p[56]),
    .gout(g_11[27]),
    .pout(p_11[27])
);
black black11_29(
    .g1(g_10[13]),
    .p1(p_10[13]),
    .g2(g[58]),
    .p2(p[58]),
    .gout(g_11[28]),
    .pout(p_11[28])
);
black black11_30(
    .g1(g_9[6]),
    .p1(p_9[6]),
    .g2(g[60]),
    .p2(p[60]),
    .gout(g_11[29]),
    .pout(p_11[29])
);
black black11_31(
    .g1(g_10[14]),
    .p1(p_10[14]),
    .g2(g[62]),
    .p2(p[62]),
    .gout(g_11[30]),
    .pout(p_11[30])
);

// P, G
wire [63:0] P, G;
generate
    for (i=0; i<31; i=i+1) begin
        assign G[2*i+2] = g_11[i];
        assign P[2*i+2] = p_11[i];
    end
    for (i=0; i<15; i=i+1) begin
        assign G[4*i+5] = g_10[i];
        assign P[4*i+5] = p_10[i];
    end
    for (i=0; i<7; i=i+1) begin
        assign G[8*i+11] = g_9[i];
        assign P[8*i+11] = p_9[i];
    end
    for (i=0; i<3; i=i+1) begin
        assign G[16*i+23] = g_8[i];
        assign P[16*i+23] = p_8[i];
    end
    for (i=0; i<1; i=i+1) begin
        assign G[32*i+47] = g_7;
        assign P[32*i+47] = p_7;
    end
endgenerate
assign G[0] = g[0];
assign P[0] = p[0];
assign G[1] = g_1[0];
assign P[1] = p_1[0];
assign G[3] = g_2[0];
assign P[3] = p_2[0];
assign G[7] = g_3[0];
assign P[7] = p_3[0];
assign G[15] = g_4[0];
assign P[15] = p_4[0];
assign G[31] = g_5[0];
assign P[31] = p_5[0];
assign G[63] = g_6;
assign P[63] = p_6;

// C, s
wire [64:0] C;
generate
    assign C[0] = cin;
    for (i=0; i<64; i=i+1) begin
        assign C[i+1] = G[i] | P[i]&C[0];
    end
endgenerate
assign cout = C[64];

assign s = C[63:0] ^ p;


endmodule



// ! 注意g1和g2的位置，弄错了就g了，呜呜~
module black (input g1, p1, g2, p2, output gout, pout);
    assign gout = g2 | p2 & g1;
    assign pout = p2 & p1;
endmodule

