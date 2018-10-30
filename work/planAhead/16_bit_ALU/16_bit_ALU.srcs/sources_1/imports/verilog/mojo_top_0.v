/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [23:0] io_led,
    input [23:0] io_dip,
    input [4:0] io_button
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_tim_true;
  timer_2 tim (
    .clk(clk),
    .rst(rst),
    .true(M_tim_true)
  );
  reg [15:0] M_aReg_d, M_aReg_q = 1'h0;
  reg [15:0] M_bReg_d, M_bReg_q = 1'h0;
  reg [5:0] M_opcode_d, M_opcode_q = 1'h0;
  localparam GETA_state = 2'd0;
  localparam GETB_state = 2'd1;
  localparam RESULT_state = 2'd2;
  localparam TEST_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = GETA_state;
  
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
  
  wire [24-1:0] M_test_io_led;
  wire [1-1:0] M_test_true;
  reg [1-1:0] M_test_clk;
  reg [1-1:0] M_test_rst;
  reg [1-1:0] M_test_test;
  testbench_4 test (
    .clk(M_test_clk),
    .rst(M_test_rst),
    .test(M_test_test),
    .io_led(M_test_io_led),
    .true(M_test_true)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_bReg_d = M_bReg_q;
    M_aReg_d = M_aReg_q;
    M_opcode_d = M_opcode_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    io_led = 24'h000000;
    M_alur_a = M_aReg_q;
    M_alur_b = M_bReg_q;
    M_alur_alufn = M_opcode_q;
    M_test_clk = M_tim_true;
    M_test_rst = rst;
    M_test_test = io_dip[16+7+0-:1];
    
    case (M_state_q)
      GETA_state: begin
        M_aReg_d[0+7-:8] = io_dip[0+7-:8];
        M_aReg_d[8+7-:8] = io_dip[8+7-:8];
        io_led = io_dip;
        if (io_button[0+0-:1]) begin
          M_state_d = GETB_state;
        end
        if (io_button[3+0-:1]) begin
          M_state_d = TEST_state;
        end
      end
      GETB_state: begin
        M_bReg_d[0+7-:8] = io_dip[0+7-:8];
        M_bReg_d[8+7-:8] = io_dip[8+7-:8];
        io_led = io_dip;
        if (io_button[1+0-:1]) begin
          M_state_d = RESULT_state;
        end
        if (io_button[3+0-:1]) begin
          M_state_d = TEST_state;
        end
      end
      RESULT_state: begin
        M_opcode_d = io_dip[16+0+5-:6];
        io_led[16+7-:8] = 8'h00;
        io_led[8+7-:8] = M_alur_alu[8+7-:8];
        io_led[0+7-:8] = M_alur_alu[0+7-:8];
        if (io_button[2+0-:1]) begin
          M_state_d = GETA_state;
          io_led = 24'h000000;
          M_alur_a = M_aReg_q;
          M_alur_b = M_bReg_q;
          M_alur_alufn = M_opcode_q;
        end
        if (io_button[3+0-:1]) begin
          M_state_d = TEST_state;
        end
      end
      TEST_state: begin
        io_led[16+0+5-:6] = M_test_io_led[16+0+5-:6];
        io_led[8+7-:8] = M_test_io_led[8+7-:8];
        io_led[0+7-:8] = M_test_io_led[0+7-:8];
        if (M_test_true) begin
          io_led[0+7-:8] = {4'h8{M_tim_true}};
          io_led[8+7-:8] = {4'h8{M_tim_true}};
          io_led[16+7-:8] = {4'h8{M_tim_true}};
        end
        if (io_button[2+0-:1]) begin
          M_state_d = GETA_state;
          io_led = 24'h000000;
          M_alur_a = M_aReg_q;
          M_alur_b = M_bReg_q;
          M_alur_alufn = M_opcode_q;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_aReg_q <= 1'h0;
      M_bReg_q <= 1'h0;
      M_opcode_q <= 1'h0;
    end else begin
      M_aReg_q <= M_aReg_d;
      M_bReg_q <= M_bReg_d;
      M_opcode_q <= M_opcode_d;
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