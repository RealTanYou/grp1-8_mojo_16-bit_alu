/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module testbench_4 (
    input clk,
    input rst,
    input test,
    output reg [23:0] io_led,
    output reg true
  );
  
  
  
  localparam TESTADDS_state = 5'd0;
  localparam TESTSUBS_state = 5'd1;
  localparam TESTMULS_state = 5'd2;
  localparam TESTDIVS_state = 5'd3;
  localparam TESTADDL_state = 5'd4;
  localparam TESTSUBL_state = 5'd5;
  localparam TESTMULL_state = 5'd6;
  localparam TESTDIVL_state = 5'd7;
  localparam TESTAND_state = 5'd8;
  localparam TESTOR_state = 5'd9;
  localparam TESTXOR_state = 5'd10;
  localparam TESTAO_state = 5'd11;
  localparam TESTBO_state = 5'd12;
  localparam TESTXNOR_state = 5'd13;
  localparam TESTNAND_state = 5'd14;
  localparam TESTNOR_state = 5'd15;
  localparam TESTCMPEQP_state = 5'd16;
  localparam TESTCMPLTP_state = 5'd17;
  localparam TESTCMPLEP_state = 5'd18;
  localparam TESTCMPEQN_state = 5'd19;
  localparam TESTCMPLTN_state = 5'd20;
  localparam TESTCMPLEN_state = 5'd21;
  localparam TESTSHL_state = 5'd22;
  localparam TESTSHR_state = 5'd23;
  localparam TESTSRA_state = 5'd24;
  localparam ALLTRUE_state = 5'd25;
  
  reg [4:0] M_state_d, M_state_q = TESTADDS_state;
  
  integer blink;
  
  wire [16-1:0] M_alur_alu;
  wire [1-1:0] M_alur_z;
  wire [1-1:0] M_alur_v;
  wire [1-1:0] M_alur_n;
  reg [16-1:0] M_alur_a;
  reg [16-1:0] M_alur_b;
  reg [6-1:0] M_alur_alufn;
  alu_3 alur (
    .a(M_alur_a),
    .b(M_alur_b),
    .alufn(M_alur_alufn),
    .alu(M_alur_alu),
    .z(M_alur_z),
    .v(M_alur_v),
    .n(M_alur_n)
  );
  
  always @* begin
    M_state_d = M_state_q;
    
    blink = 1'h0;
    true = 1'h0;
    M_alur_a = 16'h0010;
    M_alur_b = 16'h0011;
    M_alur_alufn = 6'h00;
    io_led = 24'h000000;
    if (test == 1'h1) begin
      
      case (M_state_q)
        TESTADDS_state: begin
          M_alur_alufn = 6'h00;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h00;
          if (M_alur_alu == 16'h0021) begin
            M_state_d = TESTADDL_state;
          end
        end
        TESTADDL_state: begin
          M_alur_alufn = 6'h00;
          M_alur_a = 16'h6fe0;
          M_alur_b = 16'h7ff1;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h00;
          if (M_alur_alu == 16'hefd1) begin
            M_state_d = TESTSUBS_state;
          end
        end
        TESTSUBS_state: begin
          M_alur_alufn = 6'h01;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h01;
          if (M_alur_alu == 16'hffff) begin
            M_state_d = TESTSUBL_state;
          end
        end
        TESTSUBL_state: begin
          M_alur_alufn = 6'h01;
          M_alur_a = 16'h8123;
          M_alur_b = 16'h7ff1;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h01;
          if (M_alur_alu == 16'h0132) begin
            M_state_d = TESTMULS_state;
          end
        end
        TESTMULS_state: begin
          M_alur_alufn = 6'h02;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h02;
          if (M_alur_alu == 16'h0110) begin
            M_state_d = TESTMULL_state;
          end
        end
        TESTMULL_state: begin
          M_alur_alufn = 6'h02;
          M_alur_a = 16'h6fe0;
          M_alur_b = 16'h7ff1;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h02;
          if (M_alur_alu == 16'h71e0) begin
            M_state_d = TESTDIVS_state;
          end
        end
        TESTDIVS_state: begin
          M_alur_alufn = 6'h03;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h03;
          if (M_alur_alu == 16'h0000) begin
            M_state_d = TESTDIVL_state;
          end
        end
        TESTDIVL_state: begin
          M_alur_alufn = 6'h03;
          M_alur_a = 16'h6fe0;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h03;
          if (M_alur_alu == 16'h0694) begin
            M_state_d = TESTAND_state;
          end
        end
        TESTAND_state: begin
          M_alur_alufn = 6'h18;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h18;
          if (M_alur_alu == 16'h0010) begin
            M_state_d = TESTOR_state;
          end
        end
        TESTOR_state: begin
          M_alur_alufn = 6'h1e;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h1e;
          if (M_alur_alu == 16'h0011) begin
            M_state_d = TESTXOR_state;
          end
        end
        TESTXOR_state: begin
          M_alur_alufn = 6'h16;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h16;
          if (M_alur_alu == 16'h0001) begin
            M_state_d = TESTAO_state;
          end
        end
        TESTAO_state: begin
          M_alur_alufn = 6'h1a;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h1a;
          if (M_alur_alu == 16'h0010) begin
            M_state_d = TESTBO_state;
          end
        end
        TESTBO_state: begin
          M_alur_alufn = 6'h15;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h15;
          if (M_alur_alu == 16'h0011) begin
            M_state_d = TESTXNOR_state;
          end
        end
        TESTXNOR_state: begin
          M_alur_alufn = 6'h19;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h19;
          if (M_alur_alu == 16'hfffe) begin
            M_state_d = TESTNAND_state;
          end
        end
        TESTNAND_state: begin
          M_alur_alufn = 6'h17;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h17;
          if (M_alur_alu == 16'hffef) begin
            M_state_d = TESTNOR_state;
          end
        end
        TESTNOR_state: begin
          M_alur_alufn = 6'h11;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h11;
          if (M_alur_alu == 16'hffee) begin
            M_state_d = TESTCMPEQP_state;
          end
        end
        TESTCMPEQP_state: begin
          M_alur_alufn = 6'h33;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0010;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h33;
          if (M_alur_alu == 16'h0001) begin
            M_state_d = TESTCMPEQN_state;
          end
        end
        TESTCMPEQN_state: begin
          M_alur_alufn = 6'h33;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h33;
          if (M_alur_alu == 16'h0000) begin
            M_state_d = TESTCMPLTP_state;
          end
        end
        TESTCMPLTP_state: begin
          M_alur_alufn = 6'h35;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h35;
          if (M_alur_alu == 16'h0001) begin
            M_state_d = TESTCMPLTN_state;
          end
        end
        TESTCMPLTN_state: begin
          M_alur_alufn = 6'h35;
          M_alur_a = 16'hffe0;
          M_alur_b = 16'hffd0;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h35;
          if (M_alur_alu == 16'h0000) begin
            M_state_d = TESTCMPLEP_state;
          end
        end
        TESTCMPLEP_state: begin
          M_alur_alufn = 6'h37;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0011;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h37;
          if (M_alur_alu == 16'h0001) begin
            M_state_d = TESTCMPLEN_state;
          end
        end
        TESTCMPLEN_state: begin
          M_alur_alufn = 6'h37;
          M_alur_a = 16'hffe0;
          M_alur_b = 16'hffd0;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h37;
          if (M_alur_alu == 16'h0000) begin
            M_state_d = TESTSHL_state;
          end
        end
        TESTSHL_state: begin
          M_alur_alufn = 6'h20;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0004;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h20;
          if (M_alur_alu == 16'h0100) begin
            M_state_d = TESTSHR_state;
          end
        end
        TESTSHR_state: begin
          M_alur_alufn = 6'h21;
          M_alur_a = 16'h0010;
          M_alur_b = 16'h0004;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h21;
          if (M_alur_alu == 16'h0001) begin
            M_state_d = TESTSRA_state;
          end
        end
        TESTSRA_state: begin
          M_alur_alufn = 6'h23;
          M_alur_a = 16'hffe0;
          M_alur_b = 16'h0004;
          io_led[0+7-:8] = M_alur_alu[0+7-:8];
          io_led[8+7-:8] = M_alur_alu[8+7-:8];
          io_led[16+7-:8] = 6'h23;
          if (M_alur_alu == 16'hfffe) begin
            M_state_d = ALLTRUE_state;
          end
        end
        ALLTRUE_state: begin
          true = 1'h1;
        end
      endcase
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
