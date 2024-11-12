module bcd_adder(a, b, ci, sum, co);
    input [3:0] a, b;      // 4-bit BCD inputs (0-9 each)
    input ci;              // Carry-in input
    output reg [3:0] sum;  // 4-bit BCD sum output
    output reg co;         // Carry-out output

    reg [4:0] temp_sum;    // Temporary 5-bit sum to handle overflow

    always @(*) begin
        // Initial binary addition with carry-in
        temp_sum = a + b + ci;
        
        // Check if correction is needed for BCD format (greater than 9)
        if (temp_sum > 9) begin
            temp_sum = temp_sum + 6; // Add 6 to correct to BCD
            co = 1;                  // Set carry-out
        end else begin
            co = 0;                  // No carry-out needed
        end
        
        // Assign the corrected BCD sum
        sum = temp_sum[3:0];
    end
endmodule
