`ifndef COMMON_SVH
 `define COMMON_SVH 1

 `timescale 1ns/1fs

 `define POWER_IN \
   `ifdef USE_POWER_PINS \
      inout vccd1, \
      inout vssd1, \
   `endif

 `define POWER \
   `ifdef USE_POWER_PINS \
      .vccd1( .vccd1 ), \
      .vccd2( .vccd2 ), \
   `endif

// `ifdef USE_POWER_PINS
//     inout vdda1,	// User area 1 3.3V supply
//     inout vdda2,	// User area 2 3.3V supply
//     inout vssa1,	// User area 1 analog ground
//     inout vssa2,	// User area 2 analog ground
//     inout vccd1,	// User area 1 1.8V supply
//     inout vccd2,	// User area 2 1.8v supply
//     inout vssd1,	// User area 1 digital ground
//     inout vssd2,	// User area 2 digital ground
// `endif

////////////////////////////////////////
////////////////////////////////////////
   function [5:0] f_grey6( input [5:0] inp );
      case( inp )
        6'b00_00_00: return 6'b00_00_01;
        6'b00_00_01: return 6'b00_00_11;
        6'b00_00_11: return 6'b00_00_10;
        6'b00_00_10: return 6'b00_01_10;

        6'b00_01_10: return 6'b00_01_11;
        6'b00_01_11: return 6'b00_01_01;
        6'b00_01_01: return 6'b00_01_00;
        6'b00_01_00: return 6'b00_11_00;

        6'b00_11_00: return 6'b00_11_01;
        6'b00_11_01: return 6'b00_11_11;
        6'b00_11_11: return 6'b00_11_10;
        6'b00_11_10: return 6'b00_10_10;

        6'b00_10_10: return 6'b00_10_11;
        6'b00_10_11: return 6'b00_10_01;
        6'b00_10_01: return 6'b00_10_00;
        6'b00_10_00: return 6'b01_10_00;

        6'b01_10_00: return 6'b01_10_01;
        6'b01_10_01: return 6'b01_10_11;
        6'b01_10_11: return 6'b01_10_10;
        6'b01_10_10: return 6'b01_11_10;

        6'b01_11_10: return 6'b01_11_11;
        6'b01_11_11: return 6'b01_11_01;
        6'b01_11_01: return 6'b01_11_00;
        6'b01_11_00: return 6'b01_01_00;

        6'b01_01_00: return 6'b01_01_01;
        6'b01_01_01: return 6'b01_01_11;
        6'b01_01_11: return 6'b01_01_10;
        6'b01_01_10: return 6'b01_00_10;

        6'b01_00_10: return 6'b01_00_11;
        6'b01_00_11: return 6'b01_00_01;
        6'b01_00_01: return 6'b01_00_00;
        6'b01_00_00: return 6'b11_00_00;

        6'b11_00_00: return 6'b11_00_01;
        6'b11_00_01: return 6'b11_00_11;
        6'b11_00_11: return 6'b11_00_10;
        6'b11_00_10: return 6'b11_01_10;

        6'b11_01_10: return 6'b11_01_11;
        6'b11_01_11: return 6'b11_01_01;
        6'b11_01_01: return 6'b11_01_00;
        6'b11_01_00: return 6'b11_11_00;

        6'b11_11_00: return 6'b11_11_01;
        6'b11_11_01: return 6'b11_11_11;
        6'b11_11_11: return 6'b11_11_10;
        6'b11_11_10: return 6'b11_10_10;

        6'b11_10_10: return 6'b11_10_11;
        6'b11_10_11: return 6'b11_10_01;
        6'b11_10_01: return 6'b11_10_00;
        6'b11_10_00: return 6'b10_10_00;

        6'b10_10_00: return 6'b10_10_01;
        6'b10_10_01: return 6'b10_10_11;
        6'b10_10_11: return 6'b10_10_10;
        6'b10_10_10: return 6'b10_11_10;

        6'b10_11_10: return 6'b10_11_11;
        6'b10_11_11: return 6'b10_11_01;
        6'b10_11_01: return 6'b10_11_00;
        6'b10_11_00: return 6'b10_01_00;

        6'b10_01_00: return 6'b10_01_01;
        6'b10_01_01: return 6'b10_01_11;
        6'b10_01_11: return 6'b10_01_10;
        6'b10_01_10: return 6'b10_00_10;

        6'b10_00_10: return 6'b10_00_11;
        6'b10_00_11: return 6'b10_00_01;
        6'b10_00_01: return 6'b10_00_00;
        6'b10_00_00: return 6'b00_00_00;
      endcase
   endfunction

////////////////////////////////////////
////////////////////////////////////////
   function [6:0] f_grey7( input [6:0] inp );
      case( inp )
        7'b000_0000: return 7'b000_0001;
        7'b000_0001: return 7'b000_0011;
        7'b000_0011: return 7'b000_0010;
        7'b000_0010: return 7'b000_0110;

        7'b000_0110: return 7'b000_0111;
        7'b000_0111: return 7'b000_0101;
        7'b000_0101: return 7'b000_0100;
        7'b000_0100: return 7'b000_1100;

        7'b000_1100: return 7'b000_1101;
        7'b000_1101: return 7'b000_1111;
        7'b000_1111: return 7'b000_1110;
        7'b000_1110: return 7'b000_1010;

        7'b000_1010: return 7'b000_1011;
        7'b000_1011: return 7'b000_1001;
        7'b000_1001: return 7'b000_1000;
        7'b000_1000: return 7'b001_1000;

        7'b001_1000: return 7'b001_1001;
        7'b001_1001: return 7'b001_1011;
        7'b001_1011: return 7'b001_1010;
        7'b001_1010: return 7'b001_1110;

        7'b001_1110: return 7'b001_1111;
        7'b001_1111: return 7'b001_1101;
        7'b001_1101: return 7'b001_1100;
        7'b001_1100: return 7'b001_0100;

        7'b001_0100: return 7'b001_0101;
        7'b001_0101: return 7'b001_0111;
        7'b001_0111: return 7'b001_0110;
        7'b001_0110: return 7'b001_0010;

        7'b001_0010: return 7'b001_0011;
        7'b001_0011: return 7'b001_0001;
        7'b001_0001: return 7'b001_0000;
        7'b001_0000: return 7'b011_0000;

        7'b011_0000: return 7'b011_0001;
        7'b011_0001: return 7'b011_0011;
        7'b011_0011: return 7'b011_0010;
        7'b011_0010: return 7'b011_0110;

        7'b011_0110: return 7'b011_0111;
        7'b011_0111: return 7'b011_0101;
        7'b011_0101: return 7'b011_0100;
        7'b011_0100: return 7'b011_1100;

        7'b011_1100: return 7'b011_1101;
        7'b011_1101: return 7'b011_1111;
        7'b011_1111: return 7'b011_1110;
        7'b011_1110: return 7'b011_1010;

        7'b011_1010: return 7'b011_1011;
        7'b011_1011: return 7'b011_1001;
        7'b011_1001: return 7'b011_1000;
        7'b011_1000: return 7'b010_1000;

        7'b010_1000: return 7'b010_1001;
        7'b010_1001: return 7'b010_1011;
        7'b010_1011: return 7'b010_1010;
        7'b010_1010: return 7'b010_1110;

        7'b010_1110: return 7'b010_1111;
        7'b010_1111: return 7'b010_1101;
        7'b010_1101: return 7'b010_1100;
        7'b010_1100: return 7'b010_0100;

        7'b010_0100: return 7'b010_0101;
        7'b010_0101: return 7'b010_0111;
        7'b010_0111: return 7'b010_0110;
        7'b010_0110: return 7'b010_0010;

        7'b010_0010: return 7'b010_0011;
        7'b010_0011: return 7'b010_0001;
        7'b010_0001: return 7'b010_0000;

        7'b010_0000: return 7'b110_0000;

        7'b110_0000: return 7'b110_0001;
        7'b110_0001: return 7'b110_0011;
        7'b110_0011: return 7'b110_0010;

        7'b110_0010: return 7'b110_0110;
        7'b110_0110: return 7'b110_0111;
        7'b110_0111: return 7'b110_0101;
        7'b110_0101: return 7'b110_0100;

        7'b110_0100: return 7'b110_1100;
        7'b110_1100: return 7'b110_1101;
        7'b110_1101: return 7'b110_1111;
        7'b110_1111: return 7'b110_1110;

        7'b110_1110: return 7'b110_1010;
        7'b110_1010: return 7'b110_1011;
        7'b110_1011: return 7'b110_1001;
        7'b110_1001: return 7'b110_1000;

        7'b110_1000: return 7'b111_1000;
        7'b111_1000: return 7'b111_1001;
        7'b111_1001: return 7'b111_1011;
        7'b111_1011: return 7'b111_1010;

        7'b111_1010: return 7'b111_1110;
        7'b111_1110: return 7'b111_1111;
        7'b111_1111: return 7'b111_1101;
        7'b111_1101: return 7'b111_1100;

        7'b111_1100: return 7'b111_0100;
        7'b111_0100: return 7'b111_0101;
        7'b111_0101: return 7'b111_0111;
        7'b111_0111: return 7'b111_0110;

        7'b111_0110: return 7'b111_0010;
        7'b111_0010: return 7'b111_0011;
        7'b111_0011: return 7'b111_0001;
        7'b111_0001: return 7'b111_0000;

        7'b111_0000: return 7'b101_0000;
        7'b101_0000: return 7'b101_0001;
        7'b101_0001: return 7'b101_0011;
        7'b101_0011: return 7'b101_0010;

        7'b101_0010: return 7'b101_0110;
        7'b101_0110: return 7'b101_0111;
        7'b101_0111: return 7'b101_0101;
        7'b101_0101: return 7'b101_0100;

        7'b101_0100: return 7'b101_1100;
        7'b101_1100: return 7'b101_1101;
        7'b101_1101: return 7'b101_1111;
        7'b101_1111: return 7'b101_1110;

        7'b101_1110: return 7'b101_1010;
        7'b101_1010: return 7'b101_1011;
        7'b101_1011: return 7'b101_1001;
        7'b101_1001: return 7'b101_1000;

        7'b101_1000: return 7'b100_1000;
        7'b100_1000: return 7'b100_1001;
        7'b100_1001: return 7'b100_1011;
        7'b100_1011: return 7'b100_1010;

        7'b100_1010: return 7'b100_1110;
        7'b100_1110: return 7'b100_1111;
        7'b100_1111: return 7'b100_1101;
        7'b100_1101: return 7'b100_1100;

        7'b100_1100: return 7'b100_0100;
        7'b100_0100: return 7'b100_0101;
        7'b100_0101: return 7'b100_0111;
        7'b100_0111: return 7'b100_0110;

        7'b100_0110: return 7'b100_0010;
        7'b100_0010: return 7'b100_0011;
        7'b100_0011: return 7'b100_0001;
        7'b100_0001: return 7'b100_0000;

        7'b100_0000: return 7'b000_0000;
      endcase
   endfunction

`endif

//  Top: user_project_wrapper
//         grey_code6
//           grey_code6_sync
//             reset
//         ring_osc
//         user_code
//
//         clk_scale
//           reset
//           clk_mult
//           clk_div
//           grey_code6_sync
//
//         clk_div3
//           reset
//           grey_code6_sync
//
//         clk_div5
//           reset
//           grey_code6_sync
//
//         clk_div7
//           reset
//           grey_code6_sync
//
//         clk_div11
//           reset
//           grey_code6_sync
//
//         clk_div13
//           reset
//           grey_code6_sync
//
//         clk_div17
//           reset
//           grey_code6_sync
//
//         clk_div19
//           reset
//           grey_code6_sync
//
//         clk_compare
//         grey_code6_async
//         ring_osc

