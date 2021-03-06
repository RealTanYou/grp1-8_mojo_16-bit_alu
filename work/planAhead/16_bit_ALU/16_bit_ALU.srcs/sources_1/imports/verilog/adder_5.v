/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_5 (
    input alufn0,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] s,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [15:0] xb;
  
  reg [15:0] out;
  
  always @* begin
    xb = 16'h0000;
    s = 16'h0000;
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    
    case (alufn0)
      1'h0: begin
        xb = b;
      end
      1'h1: begin
        xb = b ^ 16'hffff;
      end
    endcase
    out = (alufn0 == 1'h0) ? a + b : a - b;
    z = (out == 1'h0) ? 1'h1 : 1'h0;
    v = (a[15+0-:1] & xb[15+0-:1] & ~out[15+0-:1]) | (~a[15+0-:1] & ~xb[15+0-:1] & out[15+0-:1]);
    n = out[15+0-:1];
    s = out;
  end
endmodule
