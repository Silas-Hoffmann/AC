// ---------------------------
// -- Clock generator
// ---------------------------
module clock ( output clk );
  reg clk;
  initial
    clk = 1'b0;
  always
    #12 clk = ~clk;
endmodule

// ---------------------------
// -- Pulse generator
// ---------------------------
module pulse ( output signal, input clock );
  reg signal;
  always @ ( clock )
  begin
    signal = 1'b1;
    #3 signal = 1'b0;
    #3 signal = 1'b1;
    #3 signal = 1'b0;
  end
endmodule

// ---------------------------
// -- Trigger generator
// ---------------------------
module trigger ( output signal, input on, input clock );
  reg signal;
  always @ ( posedge clock & on )
  begin
    #60 signal = 1'b1;
    #60 signal = 1'b0;
  end
endmodule

// ---------------------------
// -- Testbench
// ---------------------------
module Guia_0901;
  wire clock;
  clock clk_gen ( clock );

  reg p;
  wire p1, t1;

  pulse pulse_gen ( p1, clock );
  trigger trigger_gen ( t1, p, clock );

  initial
    p = 1'b0;

  initial
  begin
    $dumpfile ( "Guia_0901.vcd" );
    $dumpvars ( 1, clock, p1, p, t1 );

    #060 p = 1'b1;
    #120 p = 1'b0;
    #180 p = 1'b1;
    #240 p = 1'b0;
    #300 p = 1'b1;
    #360 p = 1'b0;
    #376 $finish;
  end
endmodule
