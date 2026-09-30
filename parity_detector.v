// Code your design here
module parity_detector(input in,
                	   input clk,
                       input areset,
                       output reg parity_bit );
  parameter even = 1'b0 , odd = 1'b1;
  reg state , next_state ;
  // state transition 
  always @(*) begin
    case(state) 
      even : next_state = in ? odd : even ;
      odd : next_state = in ? even : odd ;
    endcase
    // output logic
    parity_bit = (state==odd);
  end
  // sequential logic
  always @(posedge clk , posedge areset) 
    begin
      if(areset)
        state <= even ;
      else
        state <= next_state;
  end
endmodule
