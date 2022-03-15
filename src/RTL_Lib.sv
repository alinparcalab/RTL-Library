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


////////////////////////////////////////////////////
// Latche, FF, Synchronizers, and Buffer Circuits //
////////////////////////////////////////////////////

// D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Only One output 
// Enalbe on High
`ifdef pdLq
   module pdLq #(parameter width = 1) 
   ( 
      input  logic            en_i,

      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] dl;
      
      always_latch begin
         if(en_i)begin 
            dl <= d_i; 
         end else begin
            dl <= dl;
         end     
      end

      assign q_o = dl;
      
   endmodule : pdLq
`endif

// D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Enalbe on High
`ifdef pdLaq
   module pdLaq #(parameter width = 1, parameter rval = 0)  
   ( 
      input  logic             rsn_i,
      input  logic             en_i,

      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] dl;
      
      always_latch begin
         if(!rsn_i)begin 
            dl <= rval; 
         end else if(en_i)begin 
            dl <= d_i; 
         end else begin 
            dl <= dl;
         end
      end

      assign q_o = dl;
      
   endmodule : pdLaq
`endif

// D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// 2 Out puts Q & Q NOT 
// Enalbe on High
`ifdef pdLqn
   module pdLqn #(parameter width = 1)
   ( 
      input  logic             en_i,

      input  logic [width-1:0] d_i,
      
      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] dl;
      
      always_latch begin
         if(en_i)begin 
            dl <= d_i; 
         end else begin     
            dl <= dl;
         end
      end
      
      assign q_o =   dl;
      assign qn_o = ~dl;

   endmodule : pdLqn
`endif

// D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Enalbe on High
`ifdef pdLaqn
   module pdLaqn #(parameter width = 1, parameter rval = 0)
   ( 
      input  logic             rsn_i,
      input  logic             en_i,

      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] dl;
      
      always_latch begin
         if(!rsn_i)begin 
            dl <= rval; 
         end else if(en_i)begin   
            dl <= d_i; 
         end else begin            
            dl <= dl;
         end
      end

      assign q_o  =  dl;
      assign qn_o = ~dl;
      
   endmodule : pdLaqn
`endif

// D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Only One output 
// Enalbe on High
`ifdef ndLq
   module ndLq #(parameter width = 1) 
   ( 
      input  logic            en_i,

      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] dl;
      
      always_latch begin
         if(!en_i)begin 
            dl <= d_i; 
         end else begin
            dl <= dl;
         end     
      end

      assign q_o = dl;
      
   endmodule : ndLq
`endif

// D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Enalbe on High
`ifdef ndLaq
   module ndLaq #(parameter width = 1, parameter rval = 0)  
   ( 
      input  logic             rsn_i,
      input  logic             en_i,

      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] dl;
      
      always_latch begin
         if(!rsn_i)begin 
            dl <= rval; 
         end else if(!en_i)begin 
            dl <= d_i; 
         end else begin 
            dl <= dl;
         end
      end

      assign q_o = dl;
      
   endmodule : ndLaq
`endif

// D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// 2 Out puts Q & Q NOT 
// Enalbe on High
`ifdef ndLqn
   module ndLqn #(parameter width = 1)
   ( 
      input  logic             en_i,

      input  logic [width-1:0] d_i,
      
      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] dl;
      
      always_latch begin
         if(!en_i)begin 
            dl <= d_i; 
         end else begin     
            dl <= dl;
         end
      end
      
      assign q_o =   dl;
      assign qn_o = ~dl;

   endmodule : ndLqn
`endif

// D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Enalbe on High
`ifdef ndLaqn
   module ndLaqn #(parameter width = 1, parameter rval = 0)
   ( 
      input  logic             rsn_i,
      input  logic             en_i,

      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] dl;
      
      always_latch begin
         if(!rsn_i)begin 
            dl <= rval; 
         end else if(!en_i)begin   
            dl <= d_i; 
         end else begin            
            dl <= dl;
         end
      end

      assign q_o  =  dl;
      assign qn_o = ~dl;
      
   endmodule : ndLaqn
`endif

// LOW POWER D Latch
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Enalbe on Low '0'
// Not Validated
// Not Recomanded yet 
`ifdef ndLqLp
   module ndLqLp #(parameter width = 1, parameter rval = 0)
   ( 
      input  logic             rsn_i,
      input  logic             en_i,

      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] dl;
      logic [width-1:0] NOT_dl;
      logic [width-1:0] xor_en;
      logic [width-1:0] clk_en;
      
      localparam [width-1:0] init = rval;
      
      for(genvar i=0;i<width;i=i+1)begin
         assign xor_en[i] = dl[i] ^ d_i[i];
         assign clk_en[i] = xor_en[i] & ~en_i;
         assign NOT_dl[i] = ~ dl[i]; 
      
         always_latch
              if(!rsn_i)    dl[i] <= init[i]; 
         else if(clk_en[i]) dl[i] <= NOT_dl[i]; 
         else               dl[i] <= dl[i];
      end 
      
      assign q_o = dl;
      
   endmodule : ndLqLp
`endif 

// LOW POWER D Latch
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Enalbe on Low '0'
// Not Validated
// Not Recomanded yet
`ifdef ndLqnLp
   module ndLqnLp #(parameter width = 1, parameter rval = 0)
   ( 
      input  logic rsn_i,
      input  logic en_i,

      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] dl;
      logic [width-1:0] NOT_dl;
      logic [width-1:0] xor_en;
      logic [width-1:0] clk_en;
      
      localparam [width-1:0] init = rval;
      
      for(genvar i=0;i<width;i=i+1)begin
         assign xor_en[i] = dl[i] ^ d_i[i];
         assign clk_en[i] = xor_en[i] & ~en_i;
         assign NOT_dl[i] = ~ dl[i]; 
      
         always_latch
              if(~rsn_i)    dl[i] <= init[i]; 
         else if(clk_en[i]) dl[i] <= NOT_dl[i]; 
         else               dl[i] <= dl[i];
      end 
      
      assign q_o  =     dl;
      assign qn_o = NOT_dl;
   
   endmodule : ndLqnLp
`endif



// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// No Reset!
// Only One output 
// Rising Edge 
`ifdef pdfq
   module pdfq #(parameter width = 1) 
   (
      input  logic             clk_i,
      
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );

      logic [width-1:0] df;

      always_ff @(posedge clk_i)begin
         df <= d_i;
      end

      assign q_o = df;

   endmodule : pdfq
`endif

// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Rising Edge 
`ifdef pdfsq
   module pdfsq #(parameter width = 1, parameter rval = 0) 
   (
      input  logic             rsn_i,
      input  logic             clk_i,
   
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] df;

      always_ff @(posedge clk_i)begin
         if(!rsn_i)begin
            df <= rval;    
         end else begin
            df <= d_i;
         end
      end
     
      assign q_o = df;

   endmodule : pdfsq
`endif

// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Rising Edge 
`ifdef pdfaq
   module pdfaq #(parameter width = 1, parameter rval = 0) 
   (
      input  logic             rsn_i,
      input  logic             clk_i,
      
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] df;

      always_ff @(posedge clk_i or negedge rsn_i)begin
         if(!rsn_i)begin
            df <= rval;    
         end else begin
            df <= d_i;
         end
      end

      assign q_o = df;

   endmodule : pdfaq
`endif

// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
`ifdef pdfsqn
   module pdfsqn #(parameter width = 1, parameter rval = 0)
   ( 
      input  logic             rsn_i,
      input  logic             clk_i,
      
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] df;
      
      always_ff @(posedge clk_i)begin
         if(!rsn_i)begin
            df <= rval;    
         end else begin
            df <= d_i;
         end
      end
      
      assign q_o  =  df;
      assign qn_o = ~df;

   endmodule : pdfsqn
`endif

// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
`ifdef pdfaqn
   module pdfaqn #(parameter width = 1, parameter rval = 0)
   ( 
      input  logic             rsn_i,
      input  logic             clk_i,
      
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] df;
      
      always @(posedge clk_i or negedge rsn_i)begin
         if(!rsn_i)begin
            df <= rval;    
         end else begin
            df <= d_i;
         end
      end
   
      assign q_o  =  df;
      assign qn_o = ~df;
   
   endmodule : pdfaqn
`endif

// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// No Reset!
// Only One output 
// Rising Edge 
`ifdef ndfq
   module ndfq #(parameter width = 1) 
   (
      input  logic             clk_i,
      
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );

      logic [width-1:0] df;

      always_ff @(negedge clk_i)begin
         df <= d_i;
      end

      assign q_o = df;

   endmodule : ndfq
`endif

// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Rising Edge 
`ifdef ndfsq
   module ndfsq #(parameter width = 1, parameter rval = 0) 
   (
      input  logic             rsn_i,
      input  logic             clk_i,
   
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] df;

      always_ff @(negedge clk_i)begin
         if(!rsn_i)begin
            df <= rval;    
         end else begin
            df <= d_i;
         end
      end
     
      assign q_o = df;

   endmodule : ndfsq
`endif

// D Flip Flop 
// Configurable Width from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Only One output 
// Rising Edge 
`ifdef ndfaq
   module ndfaq #(parameter width = 1, parameter rval = 0) 
   (
      input  logic             rsn_i,
      input  logic             clk_i,
      
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o
   );
   
      logic [width-1:0] df;

      always_ff @(negedge clk_i or negedge rsn_i)begin
         if(!rsn_i)begin
            df <= rval;    
         end else begin
            df <= d_i;
         end
      end

      assign q_o = df;

   endmodule : ndfaq
`endif

// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
`ifdef ndfsqn
   module ndfsqn #(parameter width = 1, parameter rval = 0)
   ( 
      input  logic             rsn_i,
      input  logic             clk_i,
      
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] df;
      
      always_ff @(negedge clk_i)begin
         if(!rsn_i)begin
            df <= rval;    
         end else begin
            df <= d_i;
         end
      end
      
      assign q_o  =  df;
      assign qn_o = ~df;

   endmodule : ndfsqn
`endif

// D Flip Flop 
// Configurable from 1 to N bits per word
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// 2 Out puts Q & Q NOT 
// Rising Edge 
`ifdef ndfaqn
   module ndfaqn #(parameter width = 1, parameter rval = 0)
   ( 
      input  logic             rsn_i,
      input  logic             clk_i,
      
      input  logic [width-1:0] d_i,

      output logic [width-1:0] q_o,
      output logic [width-1:0] qn_o
   );
   
      logic [width-1:0] df;
      
      always @(negedge clk_i or negedge rsn_i)begin
         if(!rsn_i)begin
            df <= rval;    
         end else begin
            df <= d_i;
         end
      end
   
      assign q_o  =  df;
      assign qn_o = ~df;
   
   endmodule : ndfaqn
`endif



// Synthesizable Static Clock Gate
// Latch + AND Gate
// Write Latch On Low
// Reset on Low
`ifdef CGLaA
   module CGLaA
   (
      input  logic rsn_i,
      input  logic clk_i,

      input  logic en_i,

      output logic clk_o
   );
   
      logic clk_Latch;
     
      ndLaq #(.width(1), .rval(0)) i0 (.rsn_i(rsn_i), .en_i(clk_i), .d_i(en_i), .q_o(clk_Latch));
      
      assign clk_o = clk_Latch & clk_i;
      
   endmodule : CGLaA
`endif

// Synthesizable Static Clock Gate
// Latch + AND Gate
// Write Latch On Low
`ifdef CGLA
   module CGLA
   (
      input  logic clk_i,

      input  logic en_i,

      output logic clk_o
   );
   
      logic clk_Latch;
     
      ndLq #(.width(1)) i0 (.en_i(clk_i), .d_i(en_i), .q_o(clk_Latch));
      
      assign clk_o = clk_Latch & clk_i;
      
   endmodule : CGLA
`endif 

// Synthesizable Static Clock Gate
// Flip Flop + AND Gate
// Flip Flop On Falling Edge
// Reset on Low
`ifdef CGFaA
    module CGFaA
    (
       input  logic rsn_i,
       input  logic clk_i,

       input  logic en_i,

       output logic clk_o
    );
    
       logic clk_ff;
       
       ndfaq #(.width(1), .rval(0)) i0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(en_i), .q_o(clk_ff));
       
       assign clk_o = clk_ff & clk_i;
       
    endmodule : CGFaA
`endif

// Synthesizable Static Clock Gate
// Flip Flop + AND Gate
// Flip Flop On Falling Edge
`ifdef CGFA
   module CGFA 
   (
      input  logic clk_i,

      input  logic en_i,

      output logic clk_o
   );
   
      logic clk_ff;
      
      ndfq #(.width(1)) i0 (.clk_i(clk_i), .d_i(en_i), .q_o(clk_ff));
      
      assign clk_o = clk_ff & clk_i;
      
   endmodule : CGFA
`endif

// Synthesizable Static Clock Gate
// Latch + OR Gate
// Write Latch On High
// Reset on Low
`ifdef CGLaO
   module CGLaO
   (
      input  logic rsn_i,
      input  logic clk_i,

      input  logic en_i,

      output logic clk_o
   );
   
      logic clk_Latch;
      
      pdLaq #(.width(1), .rval(0)) i0 (.rsn_i(rsn_i), .en_i(clk_i), .d_i(en_i), .q_o(clk_Latch));
      
      assign clk_o = clk_Latch | clk_i;
      
   endmodule : CGLaO
`endif

// Synthesizable Static Clock Gate
// Latch + OR Gate
// Write Latch On High
`ifdef CGLO
   module CGLO
   (
      input  logic clk_i,

      input  logic en_i,

      output logic clk_o
   );
   
      logic clk_Latch;
      
      pdLq #(.width(1)) i0 (.en_i(clk_i), .d_i(en_i), .q_o(clk_Latch));
      
      assign clk_o = clk_Latch | clk_i;
      
   endmodule : CGLO
`endif

// Synthesizable Static Clock Gate
// Flip Flop + OR Gate
// Write Flip Flop On Rising Edge
// Reset on Low
`ifdef CGFaO
   module CGFaO 
   (
      input  logic rsn_i,
      input  logic clk_i,

      input  logic en_i,

      output logic clk_o
   );
   
      logic clk_ff;

      pdfaq #(.width(1), .rval(0)) i0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(en_i), .q_o(clk_ff) );
      
      assign clk_o = clk_ff | clk_i;
      
   endmodule : CGFaO
`endif

// Synthesizable Static Clock Gate
// Flip Flop + OR Gate
// Write Flip Flop On Rising Edge
`ifdef CGFO
   module CGFO
   (
      input  logic clk_i,

      input  logic en_i,

      output logic clk_o
   );
   
      logic clk_ff;
      
      pdfq #(.width(1)) i0 (.clk_i(clk_i), .d_i(en_i), .q_o(clk_ff) );
      
      assign clk_o = clk_ff | clk_i;
   
   endmodule : CGFO
`endif

// Reset Synchronizer On Rising Edge
`ifdef PRstSync
   module PRstSync #(parameter depth = 2)
   (
      input  wire rsn_i,
      input  wire clk_i,
   
      output wire rsn_o
   );  
      logic [depth-1:0] ff;
      
      pdfaq #(.width(1)) i0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(1'b1), .q_o(ff[0]));
      
      for(genvar i=1; i<depth; i++)begin
         pdfaq #(.width(1)) in (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(ff[i-1]), .q_o(ff[i]));
      end
    
      assign rsn_o = ff[depth-1];
   
   endmodule : PRstSync
`endif

// Reset Synchronizer On Falling Edge
`ifdef NRstSync
   module NRstSync #(parameter depth = 2)
   (
      input  wire rsn_i,
      input  wire clk_i,
   
      output wire rsn_o
   );  
      logic [depth-1:0] ff;
      
      ndfaq #(.width(1)) i0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(1'b1), .q_o(ff[0]));
      
      for(genvar i=1; i<depth; i++)begin
         ndfaq #(.width(1)) in (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(ff[i-1]), .q_o(ff[i]));
      end
    
      assign rsn_o = ff[depth-1];
   
   endmodule : NRstSync
`endif

// Clock Synchronizer On Rising Edge
`ifdef PClkSync
   module PClkSync #(parameter width = 2, parameter depth = 2) // Check Technology Documentation
   (
      input  wire rsn_i,
      input  wire clk_i,
      
      input  wire [width-1:0] d_i,
      output wire [width-1:0] q_o
   ); 
      logic [depth-1:0][width-1:0] ff;
   
      pdfaq #(.width(width)) i0 (.*, .q_o(ff[0]));

      if(depth>1)begin
         for(genvar i=1; i<depth; i++)begin
            pdfaq #(.width(width)) in (.*, .d_i(ff[i-1]), .q_o(ff[i]));
         end
      end

      assign q_o = ff[depth-1];
   
   endmodule : PClkSync
`endif

// Clock Synchronizer On Falling Edge
`ifdef NClkSync
   module NClkSync #(parameter width = 2, parameter depth = 2) // Check Technology Documentation
   (
      input  wire rsn_i,
      input  wire clk_i,
      
      input  wire [width-1:0] d_i,
      output wire [width-1:0] q_o
   ); 
      logic [depth-1:0][width-1:0] ff;
   
      ndfaq #(.width(width)) i0 (.*, .q_o(ff[0]));
   
      if(depth>1)begin
         for(genvar i=1; i<depth; i++)begin
            ndfaq #(.width(width)) in (.*, .d_i(ff[i-1]), .q_o(ff[i]));
         end
      end
    
      assign q_o = ff[depth-1];
   
   endmodule : NClkSync
`endif






//////////////////////
// Counter Circuits //
//////////////////////

// Synchronous Counter
// UP Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
`ifdef supcnt
   `ifdef Beh_supcnt
      module supcnt #(parameter width = 5, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,

         input  logic             en_i,

         output logic [width-1:0] cnt_o
      );

         logic [width-1:0] dff;

         always_ff @(posedge clk_i or negedge rsn_i)begin 
            if(!rsn_i) begin
               dff <= rval;
            end else if(en_i)begin
               dff <= dff+1;
            end else begin
               dff <= dff;
            end
         end

         assign cnt_o = dff;

      endmodule : supcnt      
   `else
      module supcnt #(parameter width = 5, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,

         input  logic             en_i,

         output logic [width-1:0] cnt_o
      );
   
         localparam [width-1:0] init = rval;
         
         logic [width-1:0] dff;
         logic [width-2:0] hadder_so;
         logic [width-2:0] hadder_co;
         logic             xor_last;
         
         hadder i0 (.a_i(en_i), .b_i(dff[0]), .s_o(hadder_so[0]), .c_o(hadder_co[0]));
         pdfaq #(.width(1), .rval(init[0])) i1 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[0]), .q_o(dff[0]));
         
         for(genvar i=1; i<(width-1); i=i+1)begin
            hadder                             i2 (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
            pdfaq #(.width(1), .rval(init[i])) i3 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]));
         end
         
         assign xor_last = hadder_co[width-2] ^ dff[width-1];    
         pdfaq #(.width(1), .rval(init[width-1])) i4 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(xor_last), .q_o(dff[width-1]));
         
         assign cnt_o[width-1:0] = dff[width-1:0];
   
      endmodule : supcnt
   `endif
`endif

// Synchronous Counter
// UP Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
`ifdef suncnt
   `ifdef Beh_suncnt
      module suncnt #(parameter width = 5, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,

         input  logic             en_i,

         output logic [width-1:0] cnt_o
      );

         logic [width-1:0] dff;

         always_ff @(negedge clk_i or negedge rsn_i)begin 
            if(!rsn_i) begin
               dff <= rval;
            end else if(en_i)begin
               dff <= dff+1;
            end else begin
               dff <= dff;
            end
         end

         assign cnt_o = dff;

      endmodule : suncnt  
   `else 
      module suncnt #(parameter width = 5, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,

         input  logic             en_i,

         output logic [width-1:0] cnt_o
      );
      
         localparam [width-1:0] init = rval;
      
         logic [width-1:0] dff;
         logic [width-2:0] hadder_so;
         logic [width-2:0] hadder_co;
         logic             xor_last;
      
         hadder i0 (.a_i(en_i), .b_i(dff[0]), .s_o(hadder_so[0]), .c_o(hadder_co[0]));
         ndfaq #(.width(1), .rval(init[0])) i1 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[0]), .q_o(dff[0]));
      
         for(genvar i=1; i<(width-1); i=i+1)begin
            hadder                             i2 (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
            ndfaq #(.width(1), .rval(init[i])) i3 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]));
         end
      
         assign xor_last = hadder_co[width-2] ^ dff[width-1];    
         ndfaq #(.width(1), .rval(init[width-1])) i4 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(xor_last), .q_o(dff[width-1]));
      
         assign cnt_o[width-1:0] = dff[width-1:0];
      
      endmodule : suncnt
   `endif
`endif

// Synchronous Counter
// DOWN Counter !!!
// Configurable Width from 3 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
`ifdef sdpcnt
   `ifdef Beh_sdpcnt
      module sdpcnt #(parameter width = 5, parameter rval = 0)
      (
         input  logic             rsn_i,
         input  logic             clk_i,

         input  logic             en_i,

         output logic [width-1:0] cnt_o
      );

         logic [width-1:0] dff;

         always_ff @(posedge clk_i or negedge rsn_i)begin 
            if(!rsn_i) begin
               dff <= rval;
            end else if(en_i)begin
               dff <= dff-1;
            end else begin
               dff <= dff;
            end
         end

         assign cnt_o = dff;

      endmodule : sdpcnt  
   `else 
      module sdpcnt #(parameter width = 5, parameter rval = 0)
      (
         input  logic             rsn_i,
         input  logic             clk_i,

         input  logic             en_i,

         output logic [width-1:0] cnt_o
      );
      
         localparam [width-1:0] init = ~ rval;
         
         logic [width-1:0] dff;
         logic [width-1:0] dffn;
         logic [width-2:0] hadder_so;
         logic [width-2:0] hadder_co;
         logic             xor_last;
         
         hadder i0 (.a_i(en_i), .b_i(dff[0]), .s_o(hadder_so[0]), .c_o(hadder_co[0]));
         pdfaqn #(.width(1), .rval(init[0])) i1 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[0]), .q_o(dff[0]), .qn_o(dffn[0]));
         
         for(genvar i=1; i<(width-1); i=i+1)begin
            hadder                              i2 (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
            pdfaqn #(.width(1), .rval(init[i])) i3 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]), .qn_o(dffn[i]));
         end
         
         assign xor_last = hadder_co[width-2] ^ dff[width-1];    
         pdfaqn #(.width(1), .rval(init[width-1])) i4 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(xor_last), .q_o(dff[width-1]), .qn_o(dffn[width-1]));
         
         assign cnt_o[width-1:0] = dffn[width-1:0];
      
      endmodule : sdpcnt
   `endif
`endif

// Synchronous Counter
// DOWN Counter !!!
// Configurable Width from 3 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
`ifdef sdncnt
   `ifdef Beh_sdncnt
      module sdncnt #(parameter width = 5, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,

         input  logic             en_i,

         output logic [width-1:0] cnt_o
      );

         logic [width-1:0] dff;

         always_ff @(negedge clk_i or negedge rsn_i)begin 
            if(!rsn_i) begin
               dff <= rval;
            end else if(en_i)begin
               dff <= dff-1;
            end else begin
               dff <= dff;
            end
         end

         assign cnt_o = dff;

      endmodule : sdncnt 
   `else 
      module sdncnt #(parameter width = 5, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,

         input  logic             en_i,

         output logic [width-1:0] cnt_o
      );
      
         localparam [width-1:0] init = ~ rval;
         
         logic [width-1:0] dff;
         logic [width-1:0] dffn;
         logic [width-2:0] hadder_so;
         logic [width-2:0] hadder_co;
         logic             xor_last;
         
         hadder o0 (.a_i(en_i), .b_i(dff[0]), .s_o(hadder_so[0]), .c_o(hadder_co[0]));
         ndfaqn #(.width(1), .rval(init[0])) i1 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[0]), .q_o(dff[0]), .qn_o(dffn[0]));
         
         for(genvar i=1; i<(width-1); i=i+1)begin
            hadder                              i2 (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
            ndfaqn #(.width(1), .rval(init[i])) i3 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]), .qn_o(dffn[i]));
         end
         
         assign xor_last = hadder_co[width-2] ^ dff[width-1];    
         ndfaqn #(.width(1), .rval(init[width-1])) i4 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(xor_last), .q_o(dff[width-1]), .qn_o(dffn[width-1]));
         
         assign cnt_o[width-1:0] = dffn[width-1:0];
         
      endmodule : sdncnt
   `endif
`endif

// Synchronous Counter
// UP & DOWN Counter !!!
// Configurable Width from 3 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
`ifdef sudpcnt
   `ifdef Beh_sudpcnt
      module sudpcnt #(parameter width = 2, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,
         
         input  logic             ud_i,  // if == 0 UP || if == 1 DOWN
         input  logic             en_i,
         
         output logic [width-1:0] cnt_o
      );
      
         logic [width-1:0] dff;

         always_ff @(posedge clk_i or negedge rsn_i)begin 
            if(!rsn_i) begin
               dff <= rval;
            end else if(en_i)begin
               if(ud_i)begin    // Optimized on Synthesis
                  dff <= dff+1; //  
               end else begin   //  
                  dff <= dff-1; //   
               end
            end else begin
               dff <= dff;
            end
         end

         assign cnt_o = dff;

      endmodule : sudpcnt 
   `else
      module sudpcnt #(parameter width = 2, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,
         
         input  logic             ud_i,  // if == 0 UP || if == 1 DOWN
         input  logic             en_i,
         
         output logic [width-1:0] cnt_o
      );
      
         logic [width-1:0] next_cnt, dff, dff_n;
         
         
         assign next_cnt = {({(width-1){1'b0}}),en_i}; 
         
         addsub #(.width(width)) i0 (.a_i(dff), .b_i(next_cnt), .as_i(ud_i), .s_o(dff_n));
         
         pdfaq  #(.width(width), .rval(rval)) i1 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(dff_n), .q_o(dff));
         
         assign cnt_o = dff;
         
      endmodule : sudpcnt
   `endif
`endif

// Synchronous Counter
// UP & DOWN Counter !!!
// Configurable Width from 3 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
`ifdef sudncnt
   `ifdef Beh_sudncnt
      module sudncnt #(parameter width = 2, parameter rval = 0) 
      (
         input  logic             rsn_i,
         input  logic             clk_i,
         
         input  logic             ud_i,  // if == 0 UP || if == 1 DOWN
         input  logic             en_i,
         
         output logic [width-1:0] cnt_o
      );
      
         logic [width-1:0] dff;

         always_ff @(negedge clk_i or negedge rsn_i)begin 
            if(!rsn_i) begin
               dff <= rval;
            end else if(en_i)begin
               if(ud_i)begin    // Optimized on Synthesis
                  dff <= dff+1; //  
               end else begin   //  
                  dff <= dff-1; //   
               end
            end else begin
               dff <= dff;
            end
         end

         assign cnt_o = dff;

      endmodule : sudncnt
   `else
      module sudncnt #(parameter width = 2, parameter rval = 0)
      (
         input  logic             rsn_i,
         input  logic             clk_i,
                     
         input  logic             up_down_i,  // if == 0 UP || if == 1 DOWN
         input  logic             en_i,
         
         output logic [width-1:0] cnt_o
      );
      
         logic [width-1:0] next_cnt, dff, dff_n;

         assign next_cnt = {({(width-1){1'b0}}),en_i}; 
         
         addsub #( .width(width)) i0 (.a_i(dff), .b_i(next_cnt), .as_i(up_down_i), .s_o(dff_n));
         
         ndfaq  #( .width(width), .rval(rval)) i1 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(dff_n), .q_o(dff));
         
         assign cnt_o = dff;
      
      endmodule : sudncnt
   `endif
`endif

// Asynchronous Counter
// UP Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
`ifdef aupcnt
   module aupcnt #(parameter width = 2, parameter rval = 0) 
   (
      input  logic             rsn_i,
      input  logic             clk_i,
      input  logic             en_i,
      output logic [width-1:0] cnt_o
   );
   
      localparam [width-1:0] init = rval;
      
      logic [width-1:0]dff;
      logic [width-1:1] dffn;
      logic b0;
      
      assign b0 = en_i ^ dff[0];
      
      pdfaq #(.width(1), .rval(init[0])) i0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(b0), .q_o(dff[0]));
       
      for(genvar i=0; i<(width-1); i=i+1)begin
         ndfaqn #(.width(1), .rval(init[i+1])) i1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]));
      end 
      
      assign cnt_o[width-1:0] = dff[width-1:0];
      
   endmodule : aupcnt
`endif

// Asynchronous Counter
// UP Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
`ifdef auncnt
   module auncnt #(parameter width = 5, parameter rval = 0)
   (
      input  logic             rsn_i,
      input  logic             clk_i,
      input  logic             en_i,
      output logic [width-1:0] cnt_o
   );
   
      localparam [width-1:0] init = rval;
      
      logic [width-1:0]dff;
      logic [width-1:1] dffn;
      logic b0;
      
      assign b0 = en_i ^ dff[0];
      
      ndfaq #(.width(1), .rval(init[0])) i0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(b0), .q_o(dff[0]));

      for(genvar i=0; i<(width-1); i=i+1)begin
         ndfaqn #(.width(1), .rval(init[i+1])) i1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]));
      end
      
      assign cnt_o[width-1:0] = dff[width-1:0];
   
   endmodule : auncnt
`endif

// Asynchronous Counter
// Down Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1'
`ifdef adpcnt
   module adpcnt #(parameter width = 5, parameter rval = 1) 
   (
      input  logic             rsn_i,
      input  logic             clk_i,
      input  logic             en_i,
      output logic [width-1:0] cnt_o
   );
   
      localparam [width-1:0] init = rval;
      
      logic [width-1:0]dff;
      logic [width-1:1] dffn;
      logic b0;
      
      assign b0 = en_i ^ dff[0];
      
      pdfaq #(.width(1), .rval(init[0])) i0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(b0), .q_o(dff[0]));
       
      for(genvar i=0; i<(width-1); i=i+1)begin
         pdfaqn #(.width(1), .rval(init[i+1])) i1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]));
      end
      
      assign cnt_o[width-1:0] = dff[width-1:0];
   
   endmodule : adpcnt
`endif

// Asynchronous Counter
// Down Counter !!!
// Configurable Width from 2 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1'
`ifdef adncnt
   module adncnt #(parameter width = 5, parameter rval = 1)
   (
      input  logic rsn_i,
      input  logic clk_i,
      input  logic en_i,
      output logic [width-1:0] cnt_o
   );
   
      localparam [width-1:0] init = rval;
      
      logic [width-1:0]dff;
      logic [width-1:1] dffn;
      logic b0;
      
      assign b0 = en_i ^ dff[0];
      
      ndfaq #(.width(1), .rval(init[0])) i0 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(b0), .q_o(dff[0]));
      
      for(genvar i=0; i<(width-1); i=i+1)begin
         pdfaqn #(.width(1), .rval(init[i+1])) i1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]));
      end
      
      assign cnt_o[width-1:0] = dff[width-1:0];

   endmodule : adncnt
`endif

// Synchronous Counter
// UP Counter !!!
// GRAY CODE !!!
// Configurable Width from 1 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1' (inc_i)
// inst: pgucnt #(.width(), .rval()) ipgucnt0 (.rsn_i(), .clk_i(), .inc_i(), .gray_o());
`ifdef pgucnt
   module pgucnt #(parameter width = 5, parameter rval = 0)
   (
      input  logic             rsn_i, 
      input  logic             clk_i, 

      input  logic             inc_i,

      output logic [width-1:0] gray_o
   );
      localparam [width-1:1] lone = 0;

      logic [width-1:0] gnext, bnext, bin, gray;

      pdfaq #(.width(width), .rval(rval)) i0 (.*, .d_i(gnext), .q_o(gray));
      
      gray2bin #(.width(width)) i1 (.gray_i(gray), .bin_o(bin));

      adder #(.width(width)) i2 (.a_i(bin), .b_i({lone,inc_i}), .s_o(bnext));

      bin2gray #(.width(width)) i3 (.bin_i(bnext), .gray_o(gnext));
      
      assign gray_o = gray;

   endmodule : pgucnt
`endif

// Synchronous Counter
// UP Counter !!!
// GRAY CODE !!!
// Configurable Width from 1 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1' (inc_i)
// inst: ngucnt #(.width(), .rval()) ipgucnt0 (.rsn_i(), .clk_i(), .inc_i(), .gray_o());
`ifdef ngucnt
   module ngucnt #(parameter width = 5, parameter rval = 0)
   (
      input  logic             rsn_i, 
      input  logic             clk_i, 

      input  logic             inc_i,

      output logic [width-1:0] gray_o
   );
      localparam [width-1:1] lone = 0;

      logic [width-1:0] gnext, bnext, bin, gray;

      ndfaq #(.width(width), .rval(rval)) i0 (.*, .d_i(gnext), .q_o(gray));
      
      gray2bin #(.width(width)) i1 (.gray_i(gray), .bin_o(bin));

      adder #(.width(width)) i2 (.a_i(bin), .b_i({lone,inc_i}), .s_o(bnext));

      bin2gray #(.width(width)) i3 (.bin_i(bnext), .gray_o(gnext));
      
      assign gray_o = gray;

   endmodule : ngucnt
`endif

// Synchronous Counter
// UP Counter !!!
// GRAY CODE !!!
// Configurable Width from 1 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1' (inc_i)
// inst: pgdcnt #(.width(), .rval()) ipgucnt0 (.rsn_i(), .clk_i(), .inc_i(), .gray_o());
`ifdef pgdcnt
   module pgdcnt #(parameter width = 5, parameter rval = 0)
   (
      input  logic             rsn_i, 
      input  logic             clk_i, 

      input  logic             inc_i,

      output logic [width-1:0] gray_o
   );
      localparam [width-1:1] lone = 0;

      logic [width-1:0] gnext, bnext, bin, gray;

      pdfaq #(.width(width), .rval(rval)) i0 (.*, .d_i(gnext), .q_o(gray));
      
      gray2bin #(.width(width)) i1 (.gray_i(gray), .bin_o(bin));

      addsub #(.width(width)) i2 (.a_i(bin), .b_i({lone,inc_i}), .as_i(1'b1), .s_o(bnext));

      bin2gray #(.width(width)) i3 (.bin_i(bnext), .gray_o(gnext));
      
      assign gray_o = gray;

   endmodule : pgdcnt
`endif

// Synchronous Counter
// UP Counter !!!
// GRAY CODE !!!
// Configurable Width from 1 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1' (inc_i)
// inst: ngdcnt #(.width(), .rval()) ipgucnt0 (.rsn_i(), .clk_i(), .inc_i(), .gray_o());
`ifdef ngdcnt
   module ngdcnt #(parameter width = 5, parameter rval = 0)
   (
      input  logic             rsn_i, 
      input  logic             clk_i, 

      input  logic             inc_i,

      output logic [width-1:0] gray_o
   );
      localparam [width-1:1] lone = 0;

      logic [width-1:0] gnext, bnext, bin, gray;

      ndfaq #(.width(width), .rval(rval)) i0 (.*, .d_i(gnext), .q_o(gray));
      
      gray2bin #(.width(width)) i1 (.gray_i(gray), .bin_o(bin));

      addsub #(.width(width)) i2 (.a_i(bin), .b_i({lone,inc_i}), .as_i(1'b1), .s_o(bnext));

      bin2gray #(.width(width)) i3 (.bin_i(bnext), .gray_o(gnext));
      
      assign gray_o = gray;

   endmodule : ngdcnt
`endif

// Synchronous Counter
// UP Down Counter !!!
// GRAY CODE !!!
// Configurable Width from 1 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Rising Edge !!!
// Enable only High '1' (inc_i)
// Count up on '0' Count Down on '1' (ud_i)
// inst: pgdcnt #(.width(), .rval()) ipgucnt0 (.rsn_i(), .clk_i(), .inc_i(), .gray_o());
`ifdef pgudcnt
   module pgudcnt #(parameter width = 5, parameter rval = 0)
   (
      input  logic             rsn_i, 
      input  logic             clk_i, 

      input  logic             inc_i, 
      input  logic             ud_i, 

      output logic [width-1:0] gray_o
   );
      localparam [width-1:1] lone = 0;

      logic [width-1:0] gnext, bnext, bin, gray;

      pdfaq #(.width(width), .rval(rval)) i0 (.*, .d_i(gnext), .q_o(gray));
      
      gray2bin #(.width(width)) i1 (.gray_i(gray), .bin_o(bin));

      addsub #(.width(width)) i2 (.a_i(bin), .b_i({lone,inc_i}), .as_i(ud_i), .s_o(bnext));

      bin2gray #(.width(width)) i3 (.bin_i(bnext), .gray_o(gnext));
      
      assign gray_o = gray;

   endmodule : pgudcnt
`endif

// Synchronous Counter
// UP Down Counter !!!
// GRAY CODE !!!
// Configurable Width from 1 to N
// Configurable Reset Value (0 to N)
// Reset on Low '0'
// Falling Edge !!!
// Enable only High '1' (inc_i)
// Count up on '0' Count Down on '1' (ud_i)
// inst: ngdcnt #(.width(), .rval()) ipgucnt0 (.rsn_i(), .clk_i(), .inc_i(), .gray_o());
`ifdef ngudcnt
   module ngudcnt #(parameter width = 5, parameter rval = 0)
   (
      input  logic             rsn_i, 
      input  logic             clk_i, 

      input  logic             inc_i,
      input  logic             ud_i, 

      output logic [width-1:0] gray_o
   );
      localparam [width-1:1] lone = 0;

      logic [width-1:0] gnext, bnext, bin, gray;

      ndfaq #(.width(width), .rval(rval)) i0 (.*, .d_i(gnext), .q_o(gray));
      
      gray2bin #(.width(width)) i1 (.gray_i(gray), .bin_o(bin));

      addsub #(.width(width)) i2 (.a_i(bin), .b_i({lone,inc_i}), .as_i(ud_i), .s_o(bnext));

      bin2gray #(.width(width)) i3 (.bin_i(bnext), .gray_o(gnext));
      
      assign gray_o = gray;

   endmodule : ngudcnt
`endif




// LOADABLE COUNTERS
// ToDo



////////////////////
// Logic Circuits //
////////////////////

// 2s complement circuit
`ifdef twosc
   module twosc #(parameter width = 32)
   (
      input  logic [width-1:0] d_i,
   
      output logic [width-1:0] d_o
   );
   
      logic [width-1:1] temp; // holding for all other bits except for the lsb. LSB is always din
   
      for (genvar i = 1; i < width; i++)begin // flip after first one
         assign temp[i] = (|d_i[i-1:0]) ? ~d_i[i] : d_i[i]; // Optimized on synthesis
      end 
      
      assign d_o[width-1:0] = {temp[width-1:1], d_i[0]};
   
   endmodule : twosc 
`endif

// Even Parity Generator
`ifdef evparitygen
   module evparitygen #(parameter width = 16)  
   (
      input  logic [width-1:0] data_i,  // Data

      output logic             parity_o // generated even parity
   );
   
      assign  parity_o = ^(data_i[width-1:0]) ;
   
   endmodule : evparitygen
`endif  

// find first 1
`ifdef findfirst1
   module findfirst1 #(parameter width=32, shift=$clog2(width))
   (
      input  logic [width-1:0] d_i,
   
      output logic [shift-1:0] d_o
   );
      logic done;
   
      always_comb begin
         d_o[shift-1:0] = {shift{1'b0}};
         done = 1'b0;
   
         for (int i=width-1; i>0; i--)begin // find first one
            done |= d_i[i];
            d_o[shift-1:0] += done ? 1'b0 : 1'b1; // optimized on synthesis
         end 
      end
   
   endmodule : findfirst1 
`endif

// find first 1 hot
`ifdef findfirst1hot
   module findfirst1hot #(parameter width = 32)
   (
      input  logic [width-1:0] d_i,
   
      output logic [width-1:0] d_o
   );
      logic done;
   
      always_comb begin
         d_o[width-1:0] = {width{1'b0}};
         done = 1'b0;

         for(int i=0; i<width; i++)begin
            d_o[i] = ~done & d_i[i];
            done  |= d_i[i];
         end 
      end

   endmodule : findfirst1hot
`endif

// 32 Bit ECC econder
`ifdef ecc_encode32b
   module ecc_encode32b  
   (
      input  logic [31:0] d_i,
      output logic [06:0] ecc_o
   );
   logic [5:0] ecc_out_temp;
   
      assign ecc_out_temp[0] = d_i[0]^d_i[1]^d_i[3]^d_i[4]^d_i[6]^d_i[8]^d_i[10]^d_i[11]^d_i[13]^d_i[15]^d_i[17]^d_i[19]^d_i[21]^d_i[23]^d_i[25]^d_i[26]^d_i[28]^d_i[30];
      assign ecc_out_temp[1] = d_i[0]^d_i[2]^d_i[3]^d_i[5]^d_i[6]^d_i[9]^d_i[10]^d_i[12]^d_i[13]^d_i[16]^d_i[17]^d_i[20]^d_i[21]^d_i[24]^d_i[25]^d_i[27]^d_i[28]^d_i[31];
      assign ecc_out_temp[2] = d_i[1]^d_i[2]^d_i[3]^d_i[7]^d_i[8]^d_i[9]^d_i[10]^d_i[14]^d_i[15]^d_i[16]^d_i[17]^d_i[22]^d_i[23]^d_i[24]^d_i[25]^d_i[29]^d_i[30]^d_i[31];
      assign ecc_out_temp[3] = d_i[4]^d_i[5]^d_i[6]^d_i[7]^d_i[8]^d_i[9]^d_i[10]^d_i[18]^d_i[19]^d_i[20]^d_i[21]^d_i[22]^d_i[23]^d_i[24]^d_i[25];
      assign ecc_out_temp[4] = d_i[11]^d_i[12]^d_i[13]^d_i[14]^d_i[15]^d_i[16]^d_i[17]^d_i[18]^d_i[19]^d_i[20]^d_i[21]^d_i[22]^d_i[23]^d_i[24]^d_i[25];
      assign ecc_out_temp[5] = d_i[26]^d_i[27]^d_i[28]^d_i[29]^d_i[30]^d_i[31];
   
      assign ecc_o[6:0] = {(^d_i[31:0])^(^ecc_out_temp[5:0]),ecc_out_temp[5:0]};
   
   endmodule : ecc_encode32b
`endif

// 32 Bit ECC Decoder
`ifdef ecc_decode32b
   module ecc_decode32b  
   (
      input  logic        en_i,
      input  logic [31:0] d_i,
      input  logic [06:0] ecc_i,
      input  logic        sed_ded_i, // only do detection and no correction
      
      output logic [31:0] d_o,
      output logic [06:0] ecc_o,
      output logic        single_ecc_error_o,
      output logic        double_ecc_error_o
   );
   
      logic [6:0]  ecc_check;
      logic [38:0] error_mask;
      logic [38:0] din_plus_parity, dout_plus_parity;
   
      // Generate the ecc bits
      assign ecc_check[0] = ecc_i[0]^d_i[0]^d_i[1]^d_i[3]^d_i[4]^d_i[6]^d_i[8]^d_i[10]^d_i[11]^d_i[13]^d_i[15]^d_i[17]^d_i[19]^d_i[21]^d_i[23]^d_i[25]^d_i[26]^d_i[28]^d_i[30];
      assign ecc_check[1] = ecc_i[1]^d_i[0]^d_i[2]^d_i[3]^d_i[5]^d_i[6]^d_i[9]^d_i[10]^d_i[12]^d_i[13]^d_i[16]^d_i[17]^d_i[20]^d_i[21]^d_i[24]^d_i[25]^d_i[27]^d_i[28]^d_i[31];
      assign ecc_check[2] = ecc_i[2]^d_i[1]^d_i[2]^d_i[3]^d_i[7]^d_i[8]^d_i[9]^d_i[10]^d_i[14]^d_i[15]^d_i[16]^d_i[17]^d_i[22]^d_i[23]^d_i[24]^d_i[25]^d_i[29]^d_i[30]^d_i[31];
      assign ecc_check[3] = ecc_i[3]^d_i[4]^d_i[5]^d_i[6]^d_i[7]^d_i[8]^d_i[9]^d_i[10]^d_i[18]^d_i[19]^d_i[20]^d_i[21]^d_i[22]^d_i[23]^d_i[24]^d_i[25];
      assign ecc_check[4] = ecc_i[4]^d_i[11]^d_i[12]^d_i[13]^d_i[14]^d_i[15]^d_i[16]^d_i[17]^d_i[18]^d_i[19]^d_i[20]^d_i[21]^d_i[22]^d_i[23]^d_i[24]^d_i[25];
      assign ecc_check[5] = ecc_i[5]^d_i[26]^d_i[27]^d_i[28]^d_i[29]^d_i[30]^d_i[31];
   
      // This is the parity bit
      assign ecc_check[6] = ((^d_i[31:0])^(^ecc_i[6:0])) & ~sed_ded_i;
   
      assign single_ecc_error_o = en_i & (ecc_check[6:0] != 0) & ecc_check[6];  // this will never be on for sed_ded_i
      assign double_ecc_error_o = en_i & (ecc_check[6:0] != 0) & ~ecc_check[6]; // all errors in the sed_ded_i case will be recorded as DE
   
      // Generate the mask for error correctiong
      for (genvar i=1; i<40; i++) begin
         assign error_mask[i-1] = (ecc_check[5:0] == i);
      end
   
      // Generate the corrected data
      assign din_plus_parity[38:0] = {ecc_i[6], d_i[31:26], ecc_i[5], d_i[25:11], ecc_i[4], d_i[10:4], ecc_i[3], d_i[3:1], ecc_i[2], d_i[0], ecc_i[1:0]};
   
      assign dout_plus_parity[38:0] = single_ecc_error_o ? (error_mask[38:0] ^ din_plus_parity[38:0]) : din_plus_parity[38:0];
      assign d_o[31:0]  = {dout_plus_parity[37:32], dout_plus_parity[30:16], dout_plus_parity[14:8], dout_plus_parity[6:4], dout_plus_parity[2]};
      assign ecc_o[6:0] = {(dout_plus_parity[38] ^ (ecc_check[6:0] == 7'b1000000)), dout_plus_parity[31], dout_plus_parity[15], dout_plus_parity[7], dout_plus_parity[3], dout_plus_parity[1:0]};
    
   endmodule : ecc_decode32b
`endif

// mask and match function matches bits after finding the first 0 position
// find first starting from LSB. Skip that location and match the rest of the bits
`ifdef maskandmatch
   module maskandmatch #( parameter width = 32)
   (
      input  logic [width-1:0] mask_i,     // this will have the mask in the lower bit positions
      input  logic [width-1:0] data_i,     // this is what needs to be matched on the upper bits with the mask's upper bits
      input  logic             masken_i,   // when 1 : do mask. 0 : full match

      output logic             match_o
   );
   
      logic [width-1:0] matchvec;
      logic             masken_or_fullmask;
   
      assign masken_or_fullmask = masken_i &  ~(&mask_i[width-1:0]);
      assign matchvec[0]        = masken_or_fullmask | (mask_i[0] == data_i[0]);
   
      for(genvar i=1; i<width; i++)begin // match_after_first_zero
         assign matchvec[i] = (&mask_i[i-1:0] & masken_or_fullmask) ? 1'b1 : (mask_i[i] == data_i[i]);
      end 
   
      assign match_o = &matchvec[width-1:0]; // all bits either matched or were masked off
   
   endmodule : maskandmatch
`endif

// Check if the S_ADDR <= addr < E_ADDR
`ifdef rangecheck32b
   module rangecheck32b #(ccm_sadr = 32'h0, ccm_size = 128) 
   (
      input  logic [31:0] addr_i,     // Address to be checked for range

      output logic        in_range_o, // S_ADDR <= start_addr < E_ADDR
      output logic        in_region_o
   );
   
      localparam REGION_BITS = 4;
      localparam MASK_BITS = 10 + $clog2(ccm_size); // Mask Bits Offset + $clog2(ccm_size)
   
      logic [31:0] start_addr;
      logic [3:0]  region;
   
      assign start_addr[31:0]        = ccm_sadr;
      assign region[REGION_BITS-1:0] = start_addr[31:(32-REGION_BITS)];
   
      assign in_region_o = (addr_i[31:(32-REGION_BITS)] == region[REGION_BITS-1:0]);
      if (ccm_size == 48)
         assign in_range_o = (addr_i[31:MASK_BITS] == start_addr[31:MASK_BITS]) & ~(&addr_i[MASK_BITS-1:MASK_BITS-2]);
      else
         assign in_range_o = (addr_i[31:MASK_BITS] == start_addr[31:MASK_BITS]);
   
   endmodule : rangecheck32b
`endif

// 1 bit Half Adder
`ifdef hadder
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
`endif

// Adder
// Configurable N bit 
// Carry Transport
// Carry In Only
`ifdef adder
   module adder #(parameter width = 4) 
   (
      input  logic [width-1:0] a_i,
      input  logic [width-1:0] b_i,

      output logic [width-1:0] s_o
   );
            
      assign s_o = a_i + b_i;
      
   endmodule : adder
`endif

// Adder
// Configurable N bit 
// Carry Transport
// Carry In Only
`ifdef addci
   module addci #(parameter width = 4) 
   (
      input  logic [width-1:0] a_i,
      input  logic [width-1:0] b_i,
      input  logic             c_i,

      output logic [width-1:0] s_o
   );
   
      localparam lone = 1'b1;
      
      logic [width:0] adder_n;
      
      assign adder_n = ({a_i,lone}) + ({b_i,c_i});
      
      assign s_o = adder_n[width:1];
      
   endmodule : addci
`endif

// Adder
// Configurable N bit 
// Carry Transport
// Carry In & Carry out
`ifdef addcico
   module addcico #(parameter width = 4)
   (
      input  logic [width-1:0] a_i,
      input  logic [width-1:0] b_i,
      input  logic             c_i,

      output logic [width-1:0] s_o,
      output logic             c_o
   );
   
      localparam lone = 1'b1;
      
      logic [width+1:0] adder_n;
      
      assign adder_n = ({a_i,lone}) + ({b_i,c_i});
      
      assign s_o = adder_n[width:1];
      assign c_o = adder_n[width+1];
   
   endmodule : addcico
`endif

// Adder
// Configurable N bit 
// Carry Transport
// Carry out
`ifdef addco
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
`endif 

// Adder Subtarctor
// Configurable N bit 
// Carry Transport
// IF as_i == 0 Do ADD || IF as_i == 1 Do SUB
// No Carry Out
`ifdef addsub
   module addsub #(parameter width = 4) 
   (
      input  logic [width-1:0] a_i,
      input  logic [width-1:0] b_i,
      input  logic             as_i, // IF as_i == 0 Do ADD || IF as_i == 1 Do SUB

      output logic [width-1:0] s_o
   );
   
      logic [width-1:0] bneg;
      
      for(genvar i=0; i<width; i=i+1)begin
         assign bneg[i] = as_i ^ b_i[i];
      end 
      
      addci #(.width(width)) i0 (.a_i(a_i), .b_i(bneg), .c_i(as_i), .s_o(s_o));
   
   endmodule : addsub
`endif

// Adder Subtarctor
// Configurable N bit 
// Carry Transport
// IF ADD_SUB == 0 Do ADD || IF ADD_SUB == 1 Do SUB
// Carry OUT
`ifdef addsubco
   module addsubco #(parameter width = 4) 
   (
      input  logic [width-1:0] a_i,
      input  logic [width-1:0] b_i,
      input  logic             as_i,

      output logic [width-1:0] s_o,
      output logic             c_o
   );
   
      logic [width-1:0] b_neg;
      
      for(genvar i=0; i<width; i=i+1)begin
         assign b_neg[i] = as_i ^ b_i[i];
      end 
      
      addcico #(.width(width)) i0 (.a_i(a_i), .b_i(b_neg), .c_i(as_i), .s_o(s_o), .c_o(c_o));
      
   endmodule : addsubco
`endif

// Binary to Gray Converter
`ifdef bin2gray
   module bin2gray #(parameter width = 4)
   (
      input  logic [width-1:0] bin_i,   	
      output logic [width-1:0] gray_o
   );

      //for(genvar i=0; i<width-1; i++)begin
      //   assign gray_o[i] = bin_i[i]^bin_i[i+1];
      //end

      //assign gray_o[width-1] = bin_i[width-1];

      assign gray_o = (bin_i>>1) ^ bin_i; // optimized on Synthesis

   endmodule : bin2gray
`endif

// Gray to Binary Converter
`ifdef gray2bin
   module gray2bin #(parameter width = 4)
   (
      input  logic [width-1:0] gray_i,
      output logic [width-1:0] bin_o
   );
   
      //for(genvar i=width-1; i>0; i--)begin
      //   assign bin_o[i-1] = gray_i[i-1]^bin_o[i];
      //end

      //assign bin_o[width-1] = gray_i[width-1];

      for(genvar i=0; i<width; i++)begin
          assign bin_o[i] = ^(gray_i>>i); // Optimized on Synthesis
      end

   endmodule : gray2bin
`endif


