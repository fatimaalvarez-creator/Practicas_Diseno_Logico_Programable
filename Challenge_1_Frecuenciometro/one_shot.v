module one_shot(
    input clk, signal,
    output reg signal_one_shot
);

reg delay_signal;
reg x_or_signal_clk;

always @(posedge clk) begin
    delay_signal <= signal;
    x_or_signal_clk = delay_signal ^ clk;
    signal_one_shot = x_or_signal_clk & signal;
end

endmodule