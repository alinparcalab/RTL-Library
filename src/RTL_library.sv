// -------------------------------------------------
//                   Apache License                  
//             Version 2.0, January 2004             
//          http://www.apache.org/licenses/          
// -------------------------------------------------
// Author : Alin Petru Parcalab 
// Email  : alinparcalab@gmail.com
// File   : RTL_library.sv
// Info   : This file contains basic logic elements 
// -------------------------------------------------



// IO's: _i input; _o outputs



//////////////////////////////////////////////////////////////////////////////////
//  _________ _____    _____ ______       _________ _____      ____   ______    //
// |_   ___  |_   _|  |_   _|_   __ \    |_   ___  |_   _|   .'    \.|_   __ \  //
//   | |_  \_| | |      | |   | |__) |     | |_  \_| | |    /  .--.  \ | |__) | //
//   |  _|     | |   _  | |   |  ___/      |  _|     | |   _| |    | | |  ___/  //
//  _| |_     _| |__/ |_| |_ _| |_        _| |_     _| |__/ |  \--'  /_| |_     //
// |_____|   |________|_____|_____|      |_____|   |________|\.____.'|_____|    //
//                                                                              // 
//////////////////////////////////////////////////////////////////////////////////

// The Following Info is available only for Standard Flip flops, other information will be written as comments before each component
// Name: - First letter represent the triggering edge ex: pdff -> "p" rising edge 
//       - Second letter represent the type of flip flop ex: pdff -> "D" flip flop
//       - 3th and 4th letters represents the type for the element ex: pdff -> "ff" - Flip Flop
//       - 4th letter represent that type of the reset ex: pdffa -> "a" asynchronous; pdffs -> "s" synchronous; if this letter is missing, then the elemnt has no reset
//       - 5th letter represent that this element has an enable ex: pdff_e -> "e" - Enable
//       - 6th letter represent that this element has a standard output ex: pdff_eq -> "q" - Data output
//       - 7th letter represent that this element has an inverted output ex: pdff_eqn -> "n" - Inverted data output



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// No Reset!
// Only One output 
// Rising Edge 
module pdffq #(parameter width = 1) 
(
input  logic             clk_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(posedge clk_i )begin
   lreg <= d_i;
end

assign q_o = lreg;

endmodule : pdffq



// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// No Reset!
// Only One output 
// Rising Edge 
module pdffeq #(parameter width = 1) 
(
input  logic             clk_i,

input  logic             en_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always_ff @(posedge clk_i )begin
   lreg <= en_lreg;
end

assign q_o = lreg;

endmodule : pdffeq
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Rising Edge 
module pdffaq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(posedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= d_i;
   end
end

assign q_o = lreg;

endmodule : pdffaq



// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Rising Edge 
module pdffsq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(posedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= d_i;
   end
end

assign q_o = lreg;

endmodule : pdffsq
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
module pdffaqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  wire [width-1:0] d_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;

always @(posedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= d_i;
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : pdffaqn



// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
module pdffsqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  wire [width-1:0] d_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;

always @(posedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= d_i;
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : pdffsqn
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// Reset on Low '0'
// Only One output 
// Rising Edge 
module pdffaeq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic             en_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always_ff @(posedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= en_lreg;
   end
end

assign q_o = lreg;

endmodule : pdffaeq



// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// Reset on Low '0'
// Only One output 
// Rising Edge 
module pdffseq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic             en_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always_ff @(posedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= en_lreg;
   end
end

assign q_o = lreg;

endmodule : pdffseq
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
module pdffaeqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  logic             en_i,

input  wire [width-1:0] d_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always @(posedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= en_lreg;
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : pdffaeqn



// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
module pdffseqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  logic             en_i,

input  wire [width-1:0] d_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always @(posedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= en_lreg;
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : pdffseqn
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// No Reset!
// Only One output 
// Falling Edge 
module ndffq #(parameter width = 1) 
(
input  logic             clk_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(negedge clk_i )begin
   lreg <= d_i;
end

assign q_o = lreg;

endmodule : ndffq



// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// No Reset!
// Only One output 
// Falling Edge 
module ndffeq #(parameter width = 1) 
(
input  logic             clk_i,

input  logic             en_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always_ff @(negedge clk_i )begin
   lreg <= en_lreg;
end

assign q_o = lreg;

endmodule : ndffeq
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Falling Edge 
module ndffaq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(negedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= d_i;
   end
end

assign q_o = lreg;

endmodule : ndffaq



// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Falling Edge 
module ndffsq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(negedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= d_i;
   end
end

assign q_o = lreg;

endmodule : ndffsq
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Falling Edge 
module ndffaqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  wire [width-1:0] d_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;

always @(negedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= d_i;
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : ndffaqn



// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Falling Edge 
module ndffsqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  wire [width-1:0] d_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;

always @(negedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= d_i;
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : ndffsqn
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// Reset on Low '0'
// Only One output 
// Falling Edge 
module ndffaeq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic             en_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always_ff @(negedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= en_lreg;
   end
end

assign q_o = lreg;

endmodule : ndffaeq



// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// Reset on Low '0'
// Only One output 
// Falling Edge 
module ndffseq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic             en_i,

input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always_ff @(negedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= en_lreg;
   end
end

assign q_o = lreg;

endmodule : ndffseq
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Falling Edge 
module ndffaeqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  logic             en_i,

input  wire [width-1:0] d_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always @(negedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= en_lreg;
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : ndffaeqn



// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Enable on High
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Falling Edge 
module ndffseqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  logic             en_i,

input  wire [width-1:0] d_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;
logic [width-1:0] en_lreg;

assign en_lreg = (en_i==1'b1) ? d_i : lreg;

always @(negedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      lreg <= en_lreg;
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : ndffseqn
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// T Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Rising Edge 
module ptffaq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic [width-1:0] t_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(posedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      if(t_i)begin
         lreg <= ~lreg;
      end else begin
         lreg <= lreg;
      end
   end
end

assign q_o = lreg;

endmodule : ptffaq



// T Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Rising Edge 
module ptffsq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic [width-1:0] t_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(posedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      if(t_i)begin
         lreg <= ~lreg;
      end else begin
         lreg <= lreg;
      end
   end
end

assign q_o = lreg;

endmodule : ptffsq
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// T Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
module ptffaqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  wire [width-1:0] t_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;

always @(posedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      if(t_i)begin
         lreg <= ~lreg;
      end else begin
         lreg <= lreg;
      end
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : ptffaqn



// T Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
module ptffsqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  wire [width-1:0] t_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;

always @(posedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      if(t_i)begin
         lreg <= ~lreg;
      end else begin
         lreg <= lreg;
      end
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : ptffsqn
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// T Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Falling Edge 
module ntffaq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic [width-1:0] t_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(negedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      if(t_i)begin
         lreg <= ~lreg;
      end else begin
         lreg <= lreg;
      end
   end
end

assign q_o = lreg;

endmodule : ntffaq



// T Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Falling Edge 
module ntffsq #(parameter width = 1, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic [width-1:0] t_i,
output logic [width-1:0] q_o
);

logic [width-1:0] lreg;

always_ff @(negedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      if(t_i)begin
         lreg <= ~lreg;
      end else begin
         lreg <= lreg;
      end
   end
end

assign q_o = lreg;

endmodule : ntffsq
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// T Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
module ntffaqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  wire [width-1:0] t_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;

always @(negedge clk_i or negedge rsn_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      if(t_i)begin
         lreg <= ~lreg;
      end else begin
         lreg <= lreg;
      end
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : ntffaqn



// T Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
module ntffsqn #(parameter width = 1, parameter rst_val = 0)
( 
input  wire             rsn_i,
input  wire             clk_i,

input  wire [width-1:0] t_i,
output wire [width-1:0] q_o,
output wire [width-1:0] qn_o
);

logic [width-1:0] lreg;

always @(negedge clk_i)begin
   if(~rsn_i)begin
      lreg <= rst_val;    
   end else begin
      if(t_i)begin
         lreg <= ~lreg;
      end else begin
         lreg <= lreg;
      end
   end
end

assign q_o  =   lreg;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~lreg[i];
   end
endgenerate

endmodule : ntffsqn
/////////////////////////////////////////////////////////////////







//////////////////////////////////////////////////////////
// _____         __      _________   ______ ____  ____  // 
//|_   _|       /  \    |  _   _  |./ ___  |_   ||   _| // 
//  | |        / /\ \   |_/ | | \_| ./   \_| | |__| |   //  
//  | |   _   / ____ \      | |   | |        |  __  |   //  
// _| |__/ |_/ /    \ \_   _| |_  \ \.___.'\_| |  | |_  //
//|________|____|  |____| |_____|  \._____.'____||____| //
//                                                      //
//////////////////////////////////////////////////////////
 

// The Following Info is available only for Standard Latches, other information will be written as comments before each component
// Name: - First letter represent the triggering edge ex: pdLL -> "p" Positive edge 
//       - Second letter represent the type of flip flop ex: pdLL -> "D" Latch
//       - 3th and 4th letters represents the type for the element ex: pdLL -> "LL" - Latch
//       - 4th letter represent that type of the reset ex: pdLLa -> "a" asynchronous; pdLLs -> "s" synchronous; if this letter is missing, then the elemnt has no reset
//       - 5th letter represent that this element has an enable ex: pdLLe -> "e" - Enable
//       - 6th letter represent that this element has a standard output ex: pdLLeq -> "q" - Data output
//       - 7th letter represent that this element has an inverted output ex: pdLLeqn -> "n" - Inverted data output

//       - if 8th & 9th letters are "lp" the element is low power focused 



/////////////////////////////////////////////////////////////////
// D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Only One output 
// Enalbe on High
module pdLLq #(parameter width = 1) 
( 
input  logic            EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] dlocal;

always_latch
if(EN_i) dlocal <= d_i   ; 
else     dlocal <= dlocal;

assign q_o = dlocal;

endmodule : pdLLq



// D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Enalbe on High
module pdLLaq #(parameter width = 1, parameter rst_val = 0)  
( 
input  logic             rsn_i,
input  logic             EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] dlocal;

always_latch
     if(~rsn_i) dlocal <= rst_val; 
else if(EN_i)   dlocal <= d_i    ; 
else            dlocal <= dlocal ;

assign q_o = dlocal;

endmodule : pdLLaq



// D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Enalbe on High
module pdLLaqn #(parameter width = 1, parameter rst_val = 0)
( 
input  logic             rsn_i,
input  logic             EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o,
output logic [width-1:0] qn_o
);

logic [width-1:0] dlocal;

always_latch 
     if(~rsn_i) dlocal <= rst_val  ; 
else if(EN_i)   dlocal <= d_i   ; 
else            dlocal <= dlocal;

assign q_o = dlocal;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~dlocal[i];
   end
endgenerate

endmodule : pdLLaqn



// D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// 2 Out puts Q & Q NOT 
// Enalbe on High
module pdLLqn #(parameter width = 1)
( 
input  logic             EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o,
output logic [width-1:0] qn_o
);

logic [width-1:0] dlocal;

always_latch 
if(EN_i) dlocal <= d_i   ; 
else     dlocal <= dlocal;

assign q_o = dlocal;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~dlocal[i];
   end
endgenerate


endmodule : pdLLqn
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Only One output 
// Enalbe on High
module ndLLq #(parameter width = 1) 
( 
input  logic            EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] dlocal;

always_latch
if(~EN_i) dlocal <= d_i   ; 
else     dlocal <= dlocal;

assign q_o = dlocal;

endmodule : ndLLq



// D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Enalbe on High
module ndLLaq #(parameter width = 1, parameter rst_val = 0)  
( 
input  logic             rsn_i,
input  logic             EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] dlocal;

always_latch
     if(~rsn_i) dlocal <= rst_val; 
else if(~EN_i)   dlocal <= d_i    ; 
else            dlocal <= dlocal ;

assign q_o = dlocal;

endmodule : ndLLaq



// D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Enalbe on High
module ndLLaqn #(parameter width = 1, parameter rst_val = 0)
( 
input  logic             rsn_i,
input  logic             EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o,
output logic [width-1:0] qn_o
);

logic [width-1:0] dlocal;

always_latch 
     if(~rsn_i) dlocal <= rst_val  ; 
else if(~EN_i)   dlocal <= d_i   ; 
else            dlocal <= dlocal;

assign q_o = dlocal;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~dlocal[i];
   end
endgenerate

endmodule : ndLLaqn



// D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// 2 Out puts Q & Q NOT 
// Enalbe on High
module ndLLqn #(parameter width = 1)
( 
input  logic             EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o,
output logic [width-1:0] qn_o
);

logic [width-1:0] dlocal;

always_latch 
if(~EN_i) dlocal <= d_i   ; 
else     dlocal <= dlocal;

assign q_o = dlocal;

genvar i;
generate
   for(i=0; i<width; i++)begin
      assign qn_o[i] = ~dlocal[i];
   end
endgenerate

endmodule : ndLLqn
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// LOW POWER D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Enalbe on Low '0'
// Reduced Peak Voltage
module ndLLq_LP #(parameter width = 1, parameter rst_val = 0)
( 
input  logic             rsn_i,
input  logic             EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o
);

logic [width-1:0] dlocal;
logic [width-1:0] NOT_dlocal;
logic [width-1:0] xor_en;
logic [width-1:0] clk_en;

localparam [width-1:0] init = rst_val;

genvar i;
generate 
   for(i=0;i<width;i=i+1)begin
      assign xor_en[i]     = dlocal[i] ^ d_i[i];
      assign clk_en[i]     = xor_en[i] & ~EN_i;
      assign NOT_dlocal[i] =           ~ dlocal[i]; 

      always_latch
           if(~rsn_i)    dlocal[i] <= init[i]; 
      else if(clk_en[i]) dlocal[i] <= NOT_dlocal[i]; 
      else               dlocal[i] <= dlocal[i];
   end 
endgenerate

assign q_o = dlocal;

endmodule : ndLLq_LP



// LOW POWER D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Enalbe on Low '0'
// Reduced Peak Voltage
module ndLLqn_LP #(parameter width = 1, parameter rst_val = 0)
( 
input  logic rsn_i,
input  logic EN_i,
input  logic [width-1:0] d_i,
output logic [width-1:0] q_o,
output logic [width-1:0] qn_o
);

logic [width-1:0] dlocal;
logic [width-1:0] NOT_dlocal;
logic [width-1:0] xor_en;
logic [width-1:0] clk_en;

localparam [width-1:0] init = rst_val;

genvar i;
generate 
   for(i=0;i<width;i=i+1)begin
      assign xor_en[i]     = dlocal[i] ^ d_i[i];
      assign clk_en[i]     = xor_en[i] & ~EN_i;
      assign NOT_dlocal[i] =           ~ dlocal[i]; 
  
      always_latch
           if(~rsn_i)    dlocal[i] <= init[i]; 
      else if(clk_en[i]) dlocal[i] <= NOT_dlocal[i]; 
      else               dlocal[i] <= dlocal[i];
   end 
endgenerate

assign q_o  =     dlocal;
assign qn_o = NOT_dlocal;

endmodule : ndLLqn_LP
/////////////////////////////////////////////////////////////////







///////////////////////////////////////////////////////////////
//       __      ________   ________   _________ _______     //
//      /  \    |_   ___ \.|_   ___ \.|_   ___  |_   __ \    //
//     / /\ \     | |   \. \ | |   \. \ | |_  \_| | |__) |   //
//    / ____ \    | |    | | | |    | | |  _|  _  |  __ /    //
//  _/ /    \ \_ _| |___.' /_| |___.' /_| |___/ |_| |  \ \_  //
// |____|  |____|________.'|________.'|_________|____| |___| //
//                                                           //
///////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// 1 bit Half Adder
module hadder
(
input  logic a_i,
input  logic b_i,
output logic s_o,
output logic c_o
);

logic [1:0] hadr;

assign hadr[1:0] = a_i + b_i;

assign s_o = hadr[0];
assign c_o = hadr[1];

endmodule : hadder
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Adder
// Configurable N bit 
// Carry Transport
// Carry In Only
module addci #(parameter width = 4) 
(
input  logic [width-1:0] a_i,
input  logic [width-1:0] b_i,
input  logic             c_i,
output logic [width-1:0] s_o
);

wire logic_one = 1'b1;

logic [width:0] adder_n;

assign adder_n = ({a_i,logic_one}) + ({b_i,c_i});

assign s_o = adder_n[width:1];

endmodule : addci



// Adder
// Configurable N bit 
// Carry Transport
// Carry In & Carry out
module addcico #(parameter width = 4)
(
input  logic [width-1:0] a_i,
input  logic [width-1:0] b_i,
input  logic             c_i,
output logic [width-1:0] s_o,
output logic             c_o
);

wire logic_one = 1'b1;

logic [width+1:0] adder_n;

assign adder_n = ({a_i,logic_one}) + ({b_i,c_i});

assign s_o = adder_n[width:1];
assign c_o = adder_n[width+1];

endmodule : addcico



// Adder
// Configurable N bit 
// Carry Transport
// Carry out
module addco #(parameter width = 4)
(
input  logic [width-1:0] a_i,
input  logic [width-1:0] b_i,
output logic [width-1:0] s_o,
output logic             c_o
);

logic [width:0] adder_n;

assign adder_n = a_i + b_i;

assign s_o = adder_n[width-1:0];
assign c_o = adder_n[width];

endmodule : addco
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Adder Subtarctor
// Configurable N bit 
// Carry Transport
// IF ADD_SUB == 0 Do ADD || IF ADD_SUB == 1 Do SUB
// No Carry Out
module addsub #(parameter width = 4) 
(
input  logic [width-1:0] a_i,
input  logic [width-1:0] b_i,
input  logic             add_sub_i,
output logic [width-1:0] s_o
);

logic [width-1:0] b_neg;

genvar i;
generate
   for(i=0; i<width; i=i+1)begin
      assign b_neg[i] = add_sub_i ^ b_i[i];
   end 
endgenerate

addci #( .width(width) ) inst_addci (.a_i(a_i), .b_i(b_neg), .c_i(add_sub_i), .s_o(s_o) );

endmodule : addsub



// Adder Subtarctor
// Configurable N bit 
// Carry Transport
// IF ADD_SUB == 0 Do ADD || IF ADD_SUB == 1 Do SUB
// Carry OUT
module addsubco #(parameter width = 4) 
(
input  logic [width-1:0] a_i,
input  logic [width-1:0] b_i,
input  logic             add_sub_i,
output logic [width-1:0] s_o,
output logic             c_o
);

wire [width-1:0] b_neg;

genvar i;
generate
   for(i=0; i<width; i=i+1)begin
      assign b_neg[i] = add_sub_i ^ b_i[i];
   end 
endgenerate

addcico #( .width(width) ) inst_addcico (.a_i(a_i), .b_i(b_neg), .c_i(add_sub_i), .s_o(s_o), .c_o(c_o) );

endmodule : addsubco
/////////////////////////////////////////////////////////////////







/////////////////////////////////////////////////////////////////////////////////
//    ______   ____   _____  _____ ____  _____ _________ _________ _______     //
//  ./ ___  |.'    \.|_   _||_   _|_   \|_   _|  _   _  |_   ___  |_   __ \    //
// / ./   \_|  .--.  \ | |    | |   |   \ | | |_/ | | \_| | |_  \_| | |__) |   //
// | |      | |    | | | '    ' |   | |\ \| |     | |     |  _|  _  |  __ /    //
// \ \.___.'\  \--'  /  \ \--' /   _| |_\   |_   _| |_   _| |___/ |_| |  \ \_  //
//  \._____.'\.____.'    \.__.'   |_____|\____| |_____| |_________|____| |___| //
//                                                                             //    
/////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////
// Synchronous Counter
// UP Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
module sync_up_pcnt #(parameter width = 5, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,
input  logic             en_i,
output logic [width-1:0] cnt_o
);

localparam [width-1:0] init = rst_val;

logic [width-1:0] dff;
logic [width-2:0] hadder_so;
logic [width-2:0] hadder_co;
logic             xor_last;

hadder inst_hadder (.a_i(en_i), .b_i(dff[0]), .s_o(hadder_so[0]), .c_o(hadder_co[0]));
pdffaq #(.width(1), .rst_val(init[0])) asyc_pdff0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[0]), .q_o(dff[0]) );

genvar i;
generate 
   for(i=1; i<(width-1); i=i+1)begin
      hadder                                    inst_hadder (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
      pdffaq #(.width(1), .rst_val(init[i])) asyc_pdff1  (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]) );
   end
endgenerate

assign xor_last = hadder_co[width-2] ^ dff[width-1];    
pdffaq #(.width(1), .rst_val(init[width-1])) asyc_pdff2 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(xor_last), .q_o(dff[width-1]) );

assign cnt_o[width-1:0] = dff[width-1:0];

endmodule : sync_up_pcnt



// Synchronous Counter
// UP Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
module sync_up_ncnt #(parameter width = 5, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,
input  logic             en_i,
output logic [width-1:0] cnt_o
);

localparam [width-1:0] init = rst_val;

logic [width-1:0] dff;
logic [width-2:0] hadder_so;
logic [width-2:0] hadder_co;
logic             xor_last;

hadder inst_hadder (.a_i(en_i), .b_i(dff[0]), .s_o(hadder_so[0]), .c_o(hadder_co[0]));
ndffaq #(.width(1), .rst_val(init[0])) asyc_pdff0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[0]), .q_o(dff[0]) );

genvar i;
generate 
   for(i=1; i<(width-1); i=i+1)begin
      hadder                                 inst_hadder (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
      ndffaq #(.width(1), .rst_val(init[i])) asyc_pdff1  (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]) );
   end
endgenerate

assign xor_last = hadder_co[width-2] ^ dff[width-1];    
ndffaq #(.width(1), .rst_val(init[width-1])) asyc_pdff2 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(xor_last), .q_o(dff[width-1]) );

assign cnt_o[width-1:0] = dff[width-1:0];

endmodule : sync_up_ncnt
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Synchronous Counter
// DOWN Counter !!!
// Configurable Width from 3 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
module sync_down_pcnt #(parameter width = 5, parameter rst_val = 0)
(
input  logic             rsn_i,
input  logic             clk_i,
input  logic             en_i,
output logic [width-1:0] cnt_o
);

localparam [width-1:0] init = ~ rst_val;

logic [width-1:0] dff;
logic [width-1:0] dffn;
logic [width-2:0] hadder_so;
logic [width-2:0] hadder_co;
logic             xor_last;

hadder inst_hadder (.a_i(en_i), .b_i(dff[0]), .s_o(hadder_so[0]), .c_o(hadder_co[0]));
pdffaqn #(.width(1), .rst_val(init[0])) asyc_pdff0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[0]), .q_o(dff[0]), .qn_o(dffn[0]) );

genvar i;
generate 
   for(i=1; i<(width-1); i=i+1)begin
      hadder                                    inst_hadder (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
      pdffaqn #(.width(1), .rst_val(init[i])) asyc_pdff1  (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]), .qn_o(dffn[i]) );
   end
endgenerate

assign xor_last = hadder_co[width-2] ^ dff[width-1];    
pdffaqn #(.width(1), .rst_val(init[width-1])) asyc_pdff2 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(xor_last), .q_o(dff[width-1]), .qn_o(dffn[width-1]) );

assign cnt_o[width-1:0] = dffn[width-1:0];

endmodule : sync_down_pcnt



// Synchronous Counter
// DOWN Counter !!!
// Configurable Width from 3 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
module sync_down_ncnt #(parameter width = 5, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,
input  logic             en_i,
output logic [width-1:0] cnt_o
);

localparam [width-1:0] init = ~ rst_val;

logic [width-1:0] dff;
logic [width-1:0] dffn;
logic [width-2:0] hadder_so;
logic [width-2:0] hadder_co;
logic             xor_last;

hadder inst_hadder (.a_i(en_i), .b_i(dff[0]), .s_o(hadder_so[0]), .c_o(hadder_co[0]));
ndff2out #(.width(1), .rst_val(init[0])) asyc_pdff0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[0]), .q_o(dff[0]), .qn_o(dffn[0]) );

genvar i;
generate 
   for(i=1; i<(width-1); i=i+1)begin
      hadder                                    inst_hadder (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
      ndff2out #(.width(1), .rst_val(init[i])) asyc_pdff1  (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]), .qn_o(dffn[i]) );
   end
endgenerate

assign xor_last = hadder_co[width-2] ^ dff[width-1];    
ndff2out #(.width(1), .rst_val(init[width-1])) asyc_pdff2 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(xor_last), .q_o(dff[width-1]), .qn_o(dffn[width-1]) );

assign cnt_o[width-1:0] = dffn[width-1:0];

endmodule : sync_down_ncnt
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Synchronous Counter
// UP & DOWN Counter !!!
// Configurable Width from 3 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
module sync_up_down_pcnt #(parameter width = 2, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,

input  logic             up_down_i,  // if == 0 UP || if == 1 DOWN
input  logic             en_i,

output logic [width-1:0] cnt_o
);

logic [width-1:0] next_cnt, dff, dff_n;


assign next_cnt = {({(width-1){1'b0}}),en_i}; 

adder_sub #( .width(width) ) inst_adder_sub (.a_i(dff), .b_i(next_cnt), .add_sub_i(up_down_i), .s_o(dff_n) );

pdffaq  #( .width(width), .rst_val(rst_val) ) inst_ndff1out ( .rsn_i(rsn_i), .clk_i(clk_i), .d_i(dff_n), .q_o(dff) );

assign cnt_o = dff;

endmodule : sync_up_down_pcnt



// Synchronous Counter
// UP & DOWN Counter !!!
// Configurable Width from 3 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
module sync_up_down_ncnt #(parameter width = 2, parameter rst_val = 0)
(
input  logic             rsn_i,
input  logic             clk_i,
            
input  logic             up_down_i,  // if == 0 UP || if == 1 DOWN
input  logic             en_i,

output logic [width-1:0] cnt_o
);

logic [width-1:0] next_cnt, dff, dff_n;


assign next_cnt = {({(width-1){1'b0}}),en_i}; 

adder_sub #( .width(width) ) inst_adder_sub (.a_i(dff), .b_i(next_cnt), .add_sub_i(up_down_i), .s_o(dff_n) );

ndffaq  #( .width(width), .rst_val(rst_val) ) inst_ndff1out ( .rsn_i(rsn_i), .clk_i(clk_i), .d_i(dff_n), .q_o(dff) );

assign cnt_o = dff;

endmodule : sync_up_down_ncnt
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Asynchronous Counter
// UP Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
module async_up_pcnt #(parameter width = 2, parameter rst_val = 0) 
(
input  logic             rsn_i,
input  logic             clk_i,
input  logic             en_i,
output logic [width-1:0] cnt_o
);

localparam [width-1:0] init = rst_val;

logic [width-1:0]dff;
logic [width-1:1] dffn;
logic b0;

assign b0 = en_i ^ dff[0];

pdffaq #(.width(1), .rst_val(init[0])) asyc_pdff0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(b0), .q_o(dff[0]) );

genvar i;
generate 
   for(i=0; i<(width-1); i=i+1)begin
      ndffaqn #(.width(1), .rst_val(init[i+1])) asyc_ndff1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]) );
   end
endgenerate

assign cnt_o[width-1:0] = dff[width-1:0];

endmodule : async_up_pcnt



// Asynchronous Counter
// UP Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
module async_up_ncnt #(parameter width = 5, parameter rst_val = 0)
(
input  logic             rsn_i,
input  logic             clk_i,
input  logic             en_i,
output logic [width-1:0] cnt_o
);

localparam [width-1:0] init = rst_val;

logic [width-1:0]dff;
logic [width-1:1] dffn;
logic b0;

assign b0 = en_i ^ dff[0];

ndffaq #(.width(1), .rst_val(init[0])) asyc_pdff0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(b0), .q_o(dff[0]) );

genvar i;
generate 
   for(i=0; i<(width-1); i=i+1)begin
      ndffaqn #(.width(1), .rst_val(init[i+1])) asyc_ndff1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]) );
   end
endgenerate 

assign cnt_o[width-1:0] = dff[width-1:0];

endmodule : async_up_ncnt
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Asynchronous Counter
// Down Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
module async_down_pcnt #(parameter width = 5, parameter rst_val = 1) 
(
input  logic             rsn_i,
input  logic             clk_i,
input  logic             en_i,
output logic [width-1:0] cnt_o
);

localparam [width-1:0] init = rst_val;

logic [width-1:0]dff;
logic [width-1:1] dffn;
logic b0;

assign b0 = en_i ^ dff[0];

pdffaq #(.width(1), .rst_val(init[0])) asyc_pdff0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(b0), .q_o(dff[0]) );

genvar i;
generate 
   for(i=0; i<(width-1); i=i+1)begin
      pdffaqn #(.width(1), .rst_val(init[i+1])) asyc_pdff1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]) );
   end
endgenerate

assign cnt_o[width-1:0] = dff[width-1:0];

endmodule : async_down_pcnt



// Asynchronous Counter
// Down Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
module async_down_ncnt #(parameter width = 5, parameter rst_val = 1)
(
input  logic rsn_i,
input  logic clk_i,
input  logic en_i,
output logic [width-1:0] cnt_o
);

localparam [width-1:0] init = rst_val;

logic [width-1:0]dff;
logic [width-1:1] dffn;
logic b0;

assign b0 = en_i ^ dff[0];

ndffaq #(.width(1), .rst_val(init[0])) asyc_pdff0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(b0), .q_o(dff[0]) );

genvar i;
generate 
   for(i=0; i<(width-1); i=i+1)begin
      pdffaqn #(.width(1), .rst_val(init[i+1])) asyc_pdff1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]) );
   end
endgenerate

assign cnt_o[width-1:0] = dff[width-1:0];
endmodule : async_down_ncnt
/////////////////////////////////////////////////////////////////







///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//    ______ _____      ____     ______ ___  ____        ______        __      _________ _____ ____  _____   ______    //
//  ./ ___  |_   _|   .'    \. ./ ___  |_  ||_  _|     .' ___  |      /  \    |  _   _  |_   _|_   \|_   _|.' ___  |   //
// / ./   \_| | |    /  .--.  \ ./   \_| | |_/ /      / .'   \_|     / /\ \   |_/ | | \_| | |   |   \ | | / .'   \_|   //
// | |        | |   _| |    | | |        |  __'.      | |    ____   / ____ \      | |     | |   | |\ \| | | |    ____  //
// \ \.___.'\_| |__/ |  \--'  / \.___.'\_| |  \ \_    \ \.___]  _|_/ /    \ \_   _| |_   _| |_ _| |_\   |_\ \.___]  _| //
//  \._____.'________|\.____.' \._____.'____||____|    \._____.' |____|  |____| |_____| |_____|_____|\____|\._____.'   //
//                                                                                                                     //    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Synthesizable Static Clock Gate
// Latch + TST 
// Write Latch On Low
// Reset on Low
module CGnLLa_tst 
(
input  logic rsn_i,
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_Latch;

ndLLaq #( .width(1) , .rst_val(0) ) inst_clk_Latch ( .rsn_i(rsn_i), .EN_i(clk_i), .d_i(en_i), .q_o(clk_Latch) );

assign clk_o = clk_Latch ? clk_i : 1'bz;

endmodule : CGnLLa_tst



// Synthesizable Static Clock Gate
// Latch + TST 
// Write Latch On Low
module CGnLL_tst 
(
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_Latch;

ndLLq #( .width(1) ) inst_clk_Latch ( .EN_i(clk_i), .d_i(en_i), .q_o(clk_Latch) );

assign clk_o = clk_Latch ? clk_i : 1'bz;

endmodule : CGnLL_tst



// Synthesizable Static Clock Gate
// Latch + TST 
// Flip Flop On Falling Edge
// Reset on Low
module CGnFFa_tst 
(
input  logic rsn_i,
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_ff;

ndffaq #(.width(1), .rst_val(0)) FF_gate (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(en_i), .q_o(clk_ff) );

assign clk_o = clk_ff ? clk_i : 1'bz;

endmodule : CGnFFa_tst



// Synthesizable Static Clock Gate
// Latch + TST 
// Flip Flop On Falling Edge
module CGpFF_tst 
(
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_ff;

pdffq #(.width(1)) FF_gate (.clk_i(clk_i), .d_i(en_i), .q_o(clk_ff) );

assign clk_o = clk_ff ? clk_i : 1'bz;

endmodule : CGpFF_tst
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Synthesizable Static Clock Gate
// Latch + AND Gate
// Write Latch On Low
// Reset on Low
module CGnLLa_and
(
input  logic rsn_i,
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_Latch;

ndLLaq #( .width(1) , .rst_val(0) ) inst_clk_Latch ( .rsn_i(rsn_i), .ENB_i(clk_i), .d_i(en_i), .q_o(clk_Latch) );

assign clk_o = clk_Latch & clk_i;

endmodule : CGnLLa_and



// Synthesizable Static Clock Gate
// Latch + AND Gate
// Write Latch On Low
module CGnLL_and 
(
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_Latch;

ndLLq #( .width(1) ) inst_clk_Latch (.ENB_i(clk_i), .d_i(en_i), .q_o(clk_Latch) );

assign clk_o = clk_Latch & clk_i;

endmodule : CGnLL_and



// Synthesizable Static Clock Gate
// Flip Flop + AND Gate
// Flip Flop On Falling Edge
// Reset on Low
module CGnFFa_and
(
input  logic rsn_i,
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_ff;

ndffaq #(.width(1), .rst_val(0)) FF_gate (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(en_i), .q_o(clk_ff) );

assign clk_o = clk_ff & clk_i;

endmodule : CGnFFa_and



// Synthesizable Static Clock Gate
// Flip Flop + AND Gate
// Flip Flop On Falling Edge
module CGnFF_and 
(
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_ff;

ndffq #(.width(1)) FF_gate (.clk_i(clk_i), .d_i(en_i), .q_o(clk_ff) );

assign clk_o = clk_ff & clk_i;

endmodule : CGnFF_and
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
// Synthesizable Static Clock Gate
// Latch + OR Gate
// Write Latch On High
// Reset on Low
module CGpLLa_or 
(
input  logic rsn_i,
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_Latch;

pdLLaq #( .width(1) , .rst_val(0) ) inst_clk_Latch ( .rsn_i(rsn_i), .EN_i(clk_i), .d_i(en_i), .q_o(clk_Latch) );

assign clk_o = clk_Latch | clk_i;

endmodule : CGpLLa_or



// Synthesizable Static Clock Gate
// Latch + OR Gate
// Write Latch On High
module CGpLL_or 
(
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_Latch;

pdLL1out #( .width(1) ) inst_clk_Latch ( .EN_i(clk_i), .d_i(en_i), .q_o(clk_Latch) );

assign clk_o = clk_Latch | clk_i;

endmodule : CGpLL_or



// Synthesizable Static Clock Gate
// Flip Flop + OR Gate
// Write Flip Flop On Rising Edge
// Reset on Low
module CGpFFa_or 
(
input  logic rsn_i,
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_ff;

pdffaq #(.width(1), .rst_val(0)) FF_gate (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(en_i), .q_o(clk_ff) );

assign clk_o = clk_ff | clk_i;

endmodule : CGpFFa_or



// Synthesizable Static Clock Gate
// Flip Flop + OR Gate
// Write Flip Flop On Rising Edge
module CGpFF_or
(
input  logic clk_i,
input  logic en_i,
output logic clk_o
);

logic clk_ff;

pdffq #(.width(1)) FF_gate (.clk_i(clk_i), .d_i(en_i), .q_o(clk_ff) );

assign clk_o = clk_ff | clk_i;

endmodule : CGpFF_or
/////////////////////////////////////////////////////////////////





