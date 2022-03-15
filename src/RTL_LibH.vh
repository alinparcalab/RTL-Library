// Set Globals

`ifndef pdLq 
   //`define pdLq 
`endif

`ifndef pdLaq
   //`define pdLaq
`endif

`ifndef pdLqn
   //`define pdLqn
`endif

`ifndef pdLaqn
   //`define pdLaqn
`endif

`ifndef ndLq
   //`define ndLq
`endif

`ifndef ndLaq
   //`define ndLaq
`endif

`ifndef ndLqn
   //`define ndLqn
`endif

`ifndef ndLaqn
   //`define ndLaqn
`endif

`ifndef pdfq
   //`define pdfq
`endif

`ifndef pdfsq
   //`define pdfsq
`endif

`ifndef pdfaq
   //`define pdfaq
`endif

`ifndef pdfsqn
   //`define pdfsqn
`endif

`ifndef pdfaqn
   //`define pdfaqn
`endif

`ifndef ndfq
   //`define ndfq
`endif

`ifndef ndfsq
   //`define ndfsq
`endif

`ifndef ndfaq
   //`define ndfaq 
`endif

`ifndef ndfsqn
   //`define ndfsqn
`endif

`ifndef ndfaqn
   //`define ndfaqn
`endif

`ifndef ndLqLp
   //`define ndLqLp
`endif

`ifndef ndLqnLp
   //`define ndLqnLp
`endif

`ifndef CGLaA
   //`define CGLaA 
`endif

`ifndef CGLA
   //`define CGLA
`endif

`ifndef CGFaA
   //`define CGFaA
`endif

`ifndef CGFA
   //`define CGFA
`endif

`ifndef CGLaO
  //`define CGLaO
`endif

`ifndef CGLO
   //`define CGLO
`endif

`ifndef CGFaO
   //`define CGFaO
`endif

`ifndef CGFO
   //`define CGFO
`endif

`ifndef PRstSync
   //`define PRstSync
`endif

`ifndef NRstSync
   //`define NRstSync
`endif

`ifndef PClkSync
   //`define PClkSync
`endif

`ifndef NClkSync
   `define NClkSync
`endif

`ifndef hadder
   //`define hadder
`endif

`ifndef addci
   //`define addci
`endif

`ifndef addcico
   //`define addcico
`endif

`ifndef addco
   //`define addco
`endif

`ifndef addsub
   //`define addsub
`endif

`ifndef addsubco
   //`define addsubco
`endif

`ifndef supcnt
   //`define supcnt
   //   `define Beh_supcnt
`endif

`ifndef suncnt
   //`define suncnt
   //   `define Beh_suncnt
`endif

`ifndef sdpcnt
   //`define sdpcnt
   //   `define Beh_sdpcnt
`endif

`ifndef sdncnt
   //`define sdncnt
   //   `define Beh_sdncnt
`endif

`ifndef sudpcnt
   //`define sudpcnt
   //   `define Beh_sudpcnt
`endif

`ifndef sudncnt
   //`define sudncnt
   //   `define Beh_sudncnt
`endif

`ifndef aupcnt
   //`define aupcnt
`endif

`ifndef auncnt
   //`define auncnt
`endif

`ifndef adpcnt
   //`define adpcnt
`endif

`ifndef adncnt
   //`define adncnt
`endif

`ifndef twosc
   //`define twosc
`endif

`ifndef evparitygen
   //`define evparitygen
`endif

`ifndef findfirst1
   //`define findfirst1
`endif

`ifndef findfirst1hot
   //`define findfirst1hot
`endif

`ifndef ecc_encode32b
   //`define ecc_encode32b
`endif

`ifndef ecc_decode32b
   //`define ecc_decode32b
`endif

`ifndef maskandmatch
   //`define maskandmatch
`endif

`ifndef rangecheck32b
   //`define rangecheck32b
`endif

// Compiler Directives for Modules 
// Don't Change the below code!!!

`ifdef PClkSync
   `ifndef pdfaq
      `define pdfaq
   `endif
`endif

`ifdef NClkSync
   `ifndef ndfaq
      `define ndfaq
   `endif
`endif

`ifdef PRstSync
   `ifndef pdfaq
      `define pdfaq
   `endif
`endif

`ifdef NRstSync
   `ifndef ndfaq
      `define ndfaq
   `endif
`endif

`ifdef supcnt
   `ifndef Beh_supcnt
      `ifndef hadder
         `define hadder
      `endif
      `ifndef pdfaq
         `define pdfaq
      `endif
   `endif
`endif

`ifdef suncnt
   `ifndef Beh_suncnt
      `ifndef hadder
         `define hadder
      `endif
      `ifndef ndfaq
         `define ndfaq
      `endif
   `endif
`endif

`ifdef sdpcnt
   `ifndef Beh_sdpcnt
      `ifndef hadder
         `define hadder
      `endif
      `ifndef pdfaqn
         `define pdfaqn
      `endif
   `endif
`endif

`ifdef sdncnt
   `ifndef Beh_sdncnt
      `ifndef hadder
         `define hadder
      `endif
       `ifndef ndfaqn
          `define ndfaqn
       `endif
   `endif
`endif

`ifdef sudpcnt
   `ifndef Beh_sudpcnt
      `ifndef addsub
         `define addsub
      `endif
      `ifndef pdfaq
         `define pdfaq
      `endif
   `endif
`endif

`ifdef sudncnt
   `ifndef Beh_sudncnt
      `ifndef addsub
         `define addsub
      `endif
      `ifndef ndfaq
         `define ndfaq   
      `endif
   
   `endif
`endif

`ifdef aupcnt
   `ifndef pdfaq
      `define pdfaq
   `endif
   `ifndef ndfaqn
      `define ndfaqn
   `endif
`endif

`ifdef auncnt
   `ifndef ndfaq
      `define ndfaq
   `endif
   `ifndef ndfaqn
      `define ndfaqn   
   `endif
`endif

`ifdef adpcnt
   `ifndef pdfaq 
      `define pdfaq
   `endif
   `ifndef pdfaqn 
      `define pdfaqn
   `endif
`endif

`ifdef adncnt
   `ifndef ndfaq 
      `define ndfaq
   `endif
   `ifndef pdfaqn 
      `define pdfaqn
   `endif
`endif

`ifdef CGLaA
   `ifndef ndLaq
      `define ndLaq
   `endif
`endif

`ifdef CGLA
   `ifndef ndLq
      `define ndLq
   `endif
`endif

`ifdef CGFaA
   `ifndef ndfaq
      `define ndfaq
   `endif
`endif

`ifdef CGFA
   `ifndef ndfq
      `define ndfq
   `endif
`endif

`ifdef CGLaO
   `ifndef pdLaq
      `define pdLaq
   `endif
`endif

`ifdef CGLO
   `ifndef pdLq
      `define pdLq
   `endif
`endif

`ifdef CGFaO
   `ifndef pdfaq
      `define pdfaq
   `endif  
`endif

`ifdef CGFO
   `ifndef pdfq
      `define pdfq
   `endif
`endif

`ifdef addsub
   `ifndef addci
      `define addci
   `endif
`endif

`ifdef addsubco
   `ifndef addcico
      `define addcico
    `endif 
`endif
