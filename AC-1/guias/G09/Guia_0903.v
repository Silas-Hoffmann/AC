`include "clock.v"

// ---------------------------
// -- Pulse generator (1/3 frequência)
// ---------------------------
module pulse ( output reg signal, input clock );
  reg [1:0] count;

  initial
  begin
    signal = 0;
    count = 0;
  end

  always @ ( posedge clock )
  begin
    count = count + 1;
    if (count == 3)
    begin
      signal = ~signal;
      count = 0;
    end
  end
endmodule

// ---------------------------
// -- Testbench
// ---------------------------
module Guia_0903;
  wire clock;
  clock clk ( clock );

  wire p1;
  pulse pulse_gen ( p1, clock );

  initial
  begin
    $dumpfile ( "Guia_0903.vcd" );
    $dumpvars ( 1, clock, p1 );
    #480 $finish;
  end
endmodule
