timescale 1ns / 1ps

module booth_tb;

// Inputs
reg [7:0] x;
reg [7:0] y;

// Outputs
wire [15:0] p;

// Instantiate the Booth multiplier module
booth uut (
    .x(x),
    .y(y),
    .p(p)
);

initial begin
    // Initialize inputs
    x = 0;
    y = 0;

    // Wait for global reset to finish
    #100;
        
    // Test cases
    x = 8'd10; y = 8'd3; #20; // Expected output: p = 30
    x = 8'd15; y = 8'd5; #20; // Expected output: p = 75
    x = 8'd20; y = 8'd4; #20; // Expected output: p = 80
    x = 8'd25; y = 8'd2; #20; // Expected output: p = 50
    x = 8'd100; y = 8'd10; #20; // Expected output: p = 1000

    // Add more test cases as needed

    // Finish simulation
    $finish;
end

initial begin
    // Monitor the changes in inputs and output
    $monitor("At time %t, x = %d, y = %d, p = %d", $time, x, y, p);
end

endmodule
