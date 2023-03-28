#include "common.vh"

module ring_osc
(
`POWER_IN
 output        clk_03,
 output        clk_05,
 output        clk_07,
 output        clk_11,
 output        clk_13,
 output        clk_17,
 output        clk_19
);

////////////////////////////////////////
   wire        clk_03a  = ~ clk_03;
   wire        clk_03b  = ~ clk_03a;
   assign      clk_03   = ~ clk_03b;
   initial     clk_03   = 'b0;

////////////////////////////////////////
   wire        clk_05a  = ~ clk_05;
   wire        clk_05b  = ~ clk_05a;
   wire        clk_05c  = ~ clk_05b;
   wire        clk_05d  = ~ clk_05c;
   assign      clk_05   = ~ clk_05d;
   initial     clk_05   = 'b0;

////////////////////////////////////////
   wire        clk_07a  = ~ clk_07;
   wire        clk_07b  = ~ clk_07a;
   wire        clk_07c  = ~ clk_07b;
   wire        clk_07d  = ~ clk_07c;
   wire        clk_07e  = ~ clk_07d;
   wire        clk_07f  = ~ clk_07e;
   assign      clk_07   = ~ clk_07f;
   initial     clk_07   = 'b0;

////////////////////////////////////////
   wire        clk_11a  = ~ clk_11;
   wire        clk_11b  = ~ clk_11a;
   wire        clk_11c  = ~ clk_11b;
   wire        clk_11d  = ~ clk_11c;
   wire        clk_11e  = ~ clk_11d;
   wire        clk_11f  = ~ clk_11e;
   wire        clk_11g  = ~ clk_11f;
   wire        clk_11h  = ~ clk_11g;
   wire        clk_11i  = ~ clk_11h;
   wire        clk_11j  = ~ clk_11i;
   assign      clk_11   = ~ clk_11j;
   initial     clk_11   = 'b0;

////////////////////////////////////////
   wire        clk_13a  = ~ clk_13;
   wire        clk_13b  = ~ clk_13a;
   wire        clk_13c  = ~ clk_13b;
   wire        clk_13d  = ~ clk_13c;
   wire        clk_13e  = ~ clk_13d;
   wire        clk_13f  = ~ clk_13e;
   wire        clk_13g  = ~ clk_13f;
   wire        clk_13h  = ~ clk_13g;
   wire        clk_13i  = ~ clk_13h;
   wire        clk_13j  = ~ clk_13i;
   wire        clk_13k  = ~ clk_13j;
   wire        clk_13l  = ~ clk_13k;
   assign      clk_13   = ~ clk_13l;
   initial     clk_13   = 'b0;

////////////////////////////////////////
   wire        clk_17a  = ~ clk_17;
   wire        clk_17b  = ~ clk_17a;
   wire        clk_17c  = ~ clk_17b;
   wire        clk_17d  = ~ clk_17c;
   wire        clk_17e  = ~ clk_17d;
   wire        clk_17f  = ~ clk_17e;
   wire        clk_17g  = ~ clk_17f;
   wire        clk_17h  = ~ clk_17g;
   wire        clk_17i  = ~ clk_17h;
   wire        clk_17j  = ~ clk_17i;
   wire        clk_17k  = ~ clk_17j;
   wire        clk_17l  = ~ clk_17k;
   wire        clk_17m  = ~ clk_17l;
   wire        clk_17n  = ~ clk_17m;
   wire        clk_17o  = ~ clk_17n;
   wire        clk_17p  = ~ clk_17o;
   assign      clk_17   = ~ clk_17p;
   initial     clk_17   = 'b0;

////////////////////////////////////////
   wire        clk_19a  = ~ clk_19;
   wire        clk_19b  = ~ clk_19a;
   wire        clk_19c  = ~ clk_19b;
   wire        clk_19d  = ~ clk_19c;
   wire        clk_19e  = ~ clk_19d;
   wire        clk_19f  = ~ clk_19e;
   wire        clk_19g  = ~ clk_19f;
   wire        clk_19h  = ~ clk_19g;
   wire        clk_19i  = ~ clk_19h;
   wire        clk_19j  = ~ clk_19i;
   wire        clk_19k  = ~ clk_19j;
   wire        clk_19l  = ~ clk_19k;
   wire        clk_19m  = ~ clk_19l;
   wire        clk_19n  = ~ clk_19m;
   wire        clk_19o  = ~ clk_19n;
   wire        clk_19p  = ~ clk_19o;
   wire        clk_19q  = ~ clk_19p;
   wire        clk_19r  = ~ clk_19q;
   assign      clk_19   = ~ clk_19r;
   initial     clk_19   = 'b0;



endmodule
