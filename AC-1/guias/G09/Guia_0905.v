`include "clock.v"

// ---------------------------
// -- Pulse generator (marca de 3)
// ---------------------------
module pulse ( output reg signal, input clock );
  always @ ( posedge clock )
  begin
    signal = 1'b1;
    #3 signal = 1'b0; // Marca de 3 unidades
  end
endmodule

// ---------------------------
// -- Testbench
// ---------------------------
module Guia_0905;
  wire clock;
  clock clk ( clock );

  wire p1;
  pulse pulse_gen ( p1, clock );

  initial
  begin
    $dumpfile ( "Guia_0905.vcd" );
    $dumpvars ( 1, clock, p1 );
    #480 $finish;
  end
endmodule
