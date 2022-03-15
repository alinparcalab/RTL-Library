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
      
      genvar i;
      generate 
         for(i=0;i<width;i=i+1)begin
            assign xor_en[i] = dl[i] ^ d_i[i];
            assign clk_en[i] = xor_en[i] & ~en_i;
            assign NOT_dl[i] = ~ dl[i]; 
      
            always_latch
                 if(!rsn_i)    dl[i] <= init[i]; 
            else if(clk_en[i]) dl[i] <= NOT_dl[i]; 
            else               dl[i] <= dl[i];
         end 
      endgenerate
      
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
      
      genvar i;
      generate 
         for(i=0;i<width;i=i+1)begin
            assign xor_en[i] = dl[i] ^ d_i[i];
            assign clk_en[i] = xor_en[i] & ~en_i;
            assign NOT_dl[i] = ~ dl[i]; 
        
            always_latch
                 if(~rsn_i)    dl[i] <= init[i]; 
            else if(clk_en[i]) dl[i] <= NOT_dl[i]; 
            else               dl[i] <= dl[i];
         end 
      endgenerate
      
      assign q_o  =     dl;
      assign qn_o = NOT_dl;
   
   endmodule : ndLqnLp
`endif

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

      logic [width-1:0] lreg;

      always_ff @(posedge clk_i)begin
         lreg <= d_i;
      end

      assign q_o = lreg;

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
   
      logic [width-1:0] lreg;

      always_ff @(posedge clk_i)begin
         if(!rsn_i)begin
            lreg <= rval;    
         end else begin
            lreg <= d_i;
         end
      end
     
      assign q_o = lreg;

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
   
      logic [width-1:0] lreg;

      always_ff @(posedge clk_i or negedge rsn_i)begin
         if(!rsn_i)begin
            lreg <= rval;    
         end else begin
            lreg <= d_i;
         end
      end

      assign q_o = lreg;

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
   
      logic [width-1:0] lreg;
      
      always_ff @(posedge clk_i)begin
         if(!rsn_i)begin
            lreg <= rval;    
         end else begin
            lreg <= d_i;
         end
      end
      
      assign q_o  =  lreg;
      assign qn_o = ~lreg;

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
   
      logic [width-1:0] lreg;
      
      always @(posedge clk_i or negedge rsn_i)begin
         if(!rsn_i)begin
            lreg <= rval;    
         end else begin
            lreg <= d_i;
         end
      end
   
      assign q_o  =  lreg;
      assign qn_o = ~lreg;
   
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

      logic [width-1:0] lreg;

      always_ff @(negedge clk_i)begin
         lreg <= d_i;
      end

      assign q_o = lreg;

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
   
      logic [width-1:0] lreg;

      always_ff @(negedge clk_i)begin
         if(!rsn_i)begin
            lreg <= rval;    
         end else begin
            lreg <= d_i;
         end
      end
     
      assign q_o = lreg;

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
   
      logic [width-1:0] lreg;

      always_ff @(negedge clk_i or negedge rsn_i)begin
         if(!rsn_i)begin
            lreg <= rval;    
         end else begin
            lreg <= d_i;
         end
      end

      assign q_o = lreg;

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
   
      logic [width-1:0] lreg;
      
      always_ff @(negedge clk_i)begin
         if(!rsn_i)begin
            lreg <= rval;    
         end else begin
            lreg <= d_i;
         end
      end
      
      assign q_o  =  lreg;
      assign qn_o = ~lreg;

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
   
      logic [width-1:0] lreg;
      
      always @(negedge clk_i or negedge rsn_i)begin
         if(!rsn_i)begin
            lreg <= rval;    
         end else begin
            lreg <= d_i;
         end
      end
   
      assign q_o  =  lreg;
      assign qn_o = ~lreg;
   
   endmodule : ndfaqn
`endif



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//    ______ _____      ____     ______ ___  ____        ______        __      _________ _____ ____  _____   ______    //
//  ./ ___  |_   _|   .'    \. ./ ___  |_  ||_  _|     .' ___  |      /  \    |  _   _  |_   _|_   \|_   _|.' ___  |   //
// / ./   \_| | |    /  .--.  \ ./   \_| | |_/ /      / .'   \_|     / /\ \   |_/ | | \_| | |   |   \ | | / .'   \_|   //
// | |        | |   _| |    | | |        |  __'.      | |    ____   / ____ \      | |     | |   | |\ \| | | |    ____  //
// \ \.___.'\_| |__/ |  \--'  / \.___.'\_| |  \ \_    \ \.___]  _|_/ /    \ \_   _| |_   _| |_ _| |_\   |_\ \.___]  _| //
//  \._____.'________|\.____.' \._____.'____||____|    \._____.' |____|  |____| |_____| |_____|_____|\____|\._____.'   //
//                                                                                                                     //    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////
//       __      ________   ________   _________ _______     //
//      /  \    |_   ___ \.|_   ___ \.|_   ___  |_   __ \    //
//     / /\ \     | |   \. \ | |   \. \ | |_  \_| | |__) |   //
//    / ____ \    | |    | | | |    | | |  _|  _  |  __ /    //
//  _/ /    \ \_ _| |___.' /_| |___.' /_| |___/ |_| |  \ \_  //
// |____|  |____|________.'|________.'|_________|____| |___| //
//                                                           //
///////////////////////////////////////////////////////////////

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
      input  logic             as_i,

      output logic [width-1:0] s_o
   );
   
      logic [width-1:0] bneg;
      
      generate
         for(genvar i=0; i<width; i=i+1)begin
            assign bneg[i] = as_i ^ b_i[i];
         end 
      endgenerate
      
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
      
      generate
         for(genvar i=0; i<width; i=i+1)begin
            assign b_neg[i] = as_i ^ b_i[i];
         end 
      endgenerate
      
      addcico #(.width(width)) i0 (.a_i(a_i), .b_i(b_neg), .c_i(as_i), .s_o(s_o), .c_o(c_o));
      
   endmodule : addsubco
`endif

/////////////////////////////////////////////////////////////////////////////////
//    ______   ____   _____  _____ ____  _____ _________ _________ _______     //
//  ./ ___  |.'    \.|_   _||_   _|_   \|_   _|  _   _  |_   ___  |_   __ \    //
// / ./   \_|  .--.  \ | |    | |   |   \ | | |_/ | | \_| | |_  \_| | |__) |   //
// | |      | |    | | | '    ' |   | |\ \| |     | |     |  _|  _  |  __ /    //
// \ \.___.'\  \--'  /  \ \--' /   _| |_\   |_   _| |_   _| |___/ |_| |  \ \_  //
//  \._____.'\.____.'    \.__.'   |_____|\____| |_____| |_________|____| |___| //
//                                                                             //    
/////////////////////////////////////////////////////////////////////////////////

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
         
         generate 
            for(genvar i=1; i<(width-1); i=i+1)begin
               hadder                             i2 (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
               pdfaq #(.width(1), .rval(init[i])) i3 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]));
            end
         endgenerate
         
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
      
         generate 
            for(genvar i=1; i<(width-1); i=i+1)begin
               hadder                             i2 (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
               ndfaq #(.width(1), .rval(init[i])) i3 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]));
            end
         endgenerate
      
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
         
         generate 
            for(genvar i=1; i<(width-1); i=i+1)begin
               hadder                              i2 (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
               pdfaqn #(.width(1), .rval(init[i])) i3 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]), .qn_o(dffn[i]));
            end
         endgenerate
         
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
         
         generate 
            for(genvar i=1; i<(width-1); i=i+1)begin
               hadder                              i2 (.a_i(hadder_co[i-1]), .b_i(dff[i]), .s_o(hadder_so[i]), .c_o(hadder_co[i]));
               ndfaqn #(.width(1), .rval(init[i])) i3 (.rsn_i(rsn_i), .clk_i(clk_i), .d_i(hadder_so[i]), .q_o(dff[i]), .qn_o(dffn[i]));
            end
         endgenerate
         
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
      
      generate 
         for(genvar i=0; i<(width-1); i=i+1)begin
            ndfaqn #(.width(1), .rval(init[i+1])) i1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]));
         end
      endgenerate
      
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

      generate 
         for(genvar i=0; i<(width-1); i=i+1)begin
            ndfaqn #(.width(1), .rval(init[i+1])) i1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]));
         end
      endgenerate 
      
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
      
      generate 
         for(genvar i=0; i<(width-1); i=i+1)begin
            pdfaqn #(.width(1), .rval(init[i+1])) i1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]));
         end
      endgenerate
      
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
      
      generate 
         for(genvar i=0; i<(width-1); i=i+1)begin
            pdfaqn #(.width(1), .rval(init[i+1])) i1 (.rsn_i(rsn_i), .clk_i(dff[i]), .d_i(dffn[i+1]), .q_o(dff[i+1]), .qn_o(dffn[i+1]));
         end
      endgenerate
      
      assign cnt_o[width-1:0] = dff[width-1:0];

   endmodule : adncnt
`endif

// LOADABLE COUNTERS