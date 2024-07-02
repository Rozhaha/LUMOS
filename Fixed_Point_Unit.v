include "Defines.vh"

module Fixed_Point_Unit 
#(
    parameter WIDTH = 32,
    parameter FBITS = 10
)
(
    input wire clk,
    input wire reset,
    
    input wire [WIDTH - 1 : 0] operand_1,
    input wire [WIDTH - 1 : 0] operand_2,
    
    input wire [ 1 : 0] operation,

    output reg [WIDTH - 1 : 0] result,
    output reg ready
);

    always @(*)
    begin
        case (operation)
            FPU_ADD    : begin result <= operand_1 + operand_2; ready <= 1; end
            FPU_SUB    : begin result <= operand_1 - operand_2; ready <= 1; end
            FPU_MUL    : begin result <= product[WIDTH + FBITS - 1 : FBITS]; ready <= product_ready; end
            `FPU_SQRT   : begin result <= root; ready <= root_ready; end
            default     : begin result <= 'bz; ready <= 0; end
        endcase
    end

    always @(posedge reset)
    begin
        if (reset)  ready = 0;
        else        ready = 'bz;
    end
    // ------------------- //
    // Square Root Circuit //
    // ------------------- //
    reg [WIDTH - 1 : 0] root;
    reg root_ready;
    module sqrt_subtraction (
    input [15:0] radicand,
    output [7:0] root
);
    reg [15:0] remain;
    reg [7:0] root_reg;
    reg [3:0] i;
    
    always @(*) begin
        remain = radicand;
        root_reg = 0;
        for (i = 0; i < 8; i = i + 1) begin
            if (remain >= (root_reg << 1)) begin
                remain = remain - (root_reg << 1);
                root_reg = root_reg + 1;
            end
            root_reg = root_reg << 1;
        end
    end
    
    assign root = root_reg;
endmodule

        /*
         *  Describe Your Square Root Calculator Circuit Here.
         */

    // ------------------ //
    // Multiplier Circuit //
    // ------------------ //   
    reg [64 - 1 : 0] product;
    reg product_ready;

    reg     [15 : 0] multiplierCircuitInput1;
    reg     [15 : 0] multiplierCircuitInput2;
    wire    [31 : 0] multiplierCircuitResult;
    module multiplier_32bit (
    input [31:0] A,
    input [31:0] B,
    output [63:0] product
);
    wire [31:0] Ah, Al, Bh, Bl;
    wire [63:0] partial_product1, partial_product2, partial_product3, partial_product4;

    // Seprate A and B into high (Ah, Bh) and low (Al, Bl) segments

    assign {Ah, Al} = A;
    assign {Bh, Bl} = B;

    // Calculate partial products

    assign partial_product1 = Ah * Bh;
    assign partial_product2 = Ah * Bl;
    assign partial_product3 = Al * Bh;
    assign partial_product4 = Al * Bl;

 always @(*) begin

        partialProduct1 = assign partial_product4 = Al * Bl;
        partialProduct2 =  assign partial_product3 << 16;
        partialProduct3 = assign partial_product2 << 16;
        partialProduct4 = assign partial_product1 << 32;
        
        // Sum all the partial products
        
        assign product = partialProduct1 + partialProduct2 + partialProduct3 + partialProduct4;
        product_ready = 1;
    end
endmodule

    Multiplier multiplier_circuit
    (
        .operand_1(multiplierCircuitInput1),
        .operand_2(multiplierCircuitInput2),
        .product(multiplierCircuitResult)
    );

    reg     [31 : 0] partialProduct1;
    reg     [31 : 0] partialProduct2;
    reg     [31 : 0] partialProduct3;
    reg     [31 : 0] partialProduct4;

        /*
         *  Describe Your 32-bit Multiplier Circuit Here.
         */
         
endmodule

module Multiplier
(
    input wire [15 : 0] operand_1,
    input wire [15 : 0] operand_2,

    output reg [31 : 0] product
);

    always @(*)
    begin
        product <= operand_1 * operand_2;
    end
endmodule