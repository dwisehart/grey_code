// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
// `define MPRJ_IO_PADS 38

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

////////////////////////////////////////
   wire         clk              = user_clock2;
   wire         w_la_rst         = la_data_in[127];
   wire         w_la_incr        = la_data_in[126];

   wire [5:0]   w_grey6;
   assign       la_data_out[5:0]  = w_grey6;

   wire         w_clk03, w_clk05, w_clk07, w_clk11, w_clk13, w_clk17, w_clk19;
   assign       la_data_out[8]    = w_clk03;
   assign       la_data_out[9]    = w_clk05;
   assign       la_data_out[10]   = w_clk07;
   assign       la_data_out[11]   = w_clk11;
   assign       la_data_out[12]   = w_clk13;
   assign       la_data_out[13]   = w_clk17;
   assign       la_data_out[14]   = w_clk19;

////////////////////////////////////////
  grey_code6 m_grey_code6
  (
`ifdef USE_POWER_PINS
   .vccd1 ( vccd1 ),
   .vssd1 ( vssd1 ),
`endif
   .clk   ( clk ),
   .rst   ( w_la_rst ),
   .incr  ( w_la_incr ),
   .grey  ( w_grey6 )
  );

////////////////////////////////////////
  ring_osc m_ring_osc
  (
`ifdef USE_POWER_PINS
   .vccd1  ( vccd1 ),
   .vssd1  ( vssd1 ),
`endif
   .clk_03 ( w_clk03 ),
   .clk_05 ( w_clk05 ),
   .clk_07 ( w_clk07 ),
   .clk_11 ( w_clk11 ),
   .clk_13 ( w_clk13 ),
   .clk_17 ( w_clk17 ),
   .clk_19 ( w_clk19 )
  );

////////////////////////////////////////
user_code #( .BITS( BITS ) )
m_user_code
(
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vssa1,	// User area 1 analog ground
 .vccd1(vccd1),	// User area 1 1.8V power
 .vssd1(vssd1),	// User area 1 digital ground
`endif

 .wb_clk_i(wb_clk_i),
 .wb_rst_i(wb_rst_i),
 .wbs_cyc_i(wbs_cyc_i),
 .wbs_stb_i(wbs_stb_i),
 .wbs_we_i(wbs_we_i),
 .wbs_sel_i(wbs_sel_i),
 .wbs_adr_i(wbs_adr_i),
 .wbs_dat_i(wbs_dat_i),
 .wbs_ack_o(wbs_ack_o),
 .wbs_dat_o(wbs_dat_o),

 .la_data_in(la_data_in),
 .la_data_out(la_data_out),
 .la_oenb (la_oenb),

 .io_in (io_in),
 .io_out(io_out),
 .io_oeb(io_oeb),
 .analog_io(analog_io),

 .user_clock2(user_clock2),
 .irq(user_irq)
);

endmodule

`default_nettype wire
