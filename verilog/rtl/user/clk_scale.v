#include "common.vh"

module clk_scale
(
`POWER_IN
 input         rst,
 input         clk,

 output [5:0]  grey, grey_m2, grey_m4, grey_m8, grey_d2, grey_d4, grey_d8
);

////////////////////////////////////////
   wire       w_rst;
   reset m_reset( `POWER .clk( clk ), .rst( rst ), .reset( w_rst ) );

////////////////////////////////////////
   wire       clk_m2, clk_m4, clk_m8;
   wire       clk_d2, clk_d4, clk_d4;

   clk_mult2 m_mult_2( `POWER .clk( clk ),    .rst( w_rst ), .clk_2x( clk_m2 ) );
   clk_mult2 m_mult_4( `POWER .clk( clk_m2 ), .rst( w_rst ), .clk_2x( clk_m4 ) );
   clk_mult2 m_mult_8( `POWER .clk( clk_m4 ), .rst( w_rst ), .clk_2x( clk_m8 ) );
   clk_div2  m_div_2(  `POWER .clk( clk ),    .rst( w_rst ), .clk_2x( clk_d2 ) );
   clk_div2  m_div_4(  `POWER .clk( clk_d2 ), .rst( w_rst ), .clk_2x( clk_d4 ) );
   clk_div2  m_div_8(  `POWER .clk( clk_d4 ), .rst( w_rst ), .clk_2x( clk_d8 ) );

 ////////////////////////////////////////
   grey_code6_sync m_grey(    `POWER .clk( clk ),    .rst( w_rst ), .incr_sync( 'b1 ), .grey( grey ) );
   grey_code6_sync m_grey_m2( `POWER .clk( clk_m2 ), .rst( w_rst ), .incr_sync( 'b1 ), .grey( grey_m2 ) );
   grey_code6_sync m_grey_m4( `POWER .clk( clk_m4 ), .rst( w_rst ), .incr_sync( 'b1 ), .grey( grey_m4 ) );
   grey_code6_sync m_grey_m8( `POWER .clk( clk_m8 ), .rst( w_rst ), .incr_sync( 'b1 ), .grey( grey_m8 ) );
   grey_code6_sync m_grey_d2( `POWER .clk( clk_d2 ), .rst( w_rst ), .incr_sync( 'b1 ), .grey( grey_d2 ) );
   grey_code6_sync m_grey_d4( `POWER .clk( clk_d4 ), .rst( w_rst ), .incr_sync( 'b1 ), .grey( grey_d4 ) );
   grey_code6_sync m_grey_d8( `POWER .clk( clk_d8 ), .rst( w_rst ), .incr_sync( 'b1 ), .grey( grey_d8 ) );

endmodule
