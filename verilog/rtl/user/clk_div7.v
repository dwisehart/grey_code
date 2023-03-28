#include "common.vh"

module clk_div7
(
`POWER_IN
 input         rst,
 input         clk,

 output [5:0]  grey
);

////////////////////////////////////////
   wire       w_rst;
   reset m_reset( `POWER .clk( clk ), .rst( rst ), .reset( w_rst ) );

////////////////////////////////////////
   reg [3:0]  r_cnt;
   reg        r_incr;

   always @( posedge clk )
     if( w_rst ) begin
        r_cnt         <= 'd0;
        r_incr        <= 'b0;
     end
     else if( r_cnt == 'b0101 ) begin
        r_cnt         <= 'd0;
        r_incr        <= 'b1;
     end
     else begin
        r_cnt         <= f_grey6( r_cnt );
        r_incr        <= 'b0;
     end

 ////////////////////////////////////////
   grey_code6_sync m_grey( `POWER .clk( clk ), .rst( rst ), .incr_sync( r_incr ), .grey( grey ) );

endmodule
