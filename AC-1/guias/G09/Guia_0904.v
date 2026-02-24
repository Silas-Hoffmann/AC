`include "clock.v"

// ---------------------------
// -- Pulse generator (4x frequência)
// ---------------------------
module pulse ( output reg signal, input clock );
  always @ ( posedge clock or negedge clock )
  begin
    signal = ~signal; // Troca a cada borda (duas vezes por período)
  end
endmodule

// ---------------------------
// -- Testbench
// ---------------------------
module Guia_0904;
  wire clock;
  clock clk ( clock );

  wire p1;
  pulse pulse_gen ( p1, clock );

  initial
  begin
    $dumpfile ( "Guia_0904.vcd" );
    $dumpvars ( 1, clock, p1 );
    #480 $finish;
  end
endmodule
