Name: Rozha Hasheminezhad

Team member: Jeyran Tarbiati

Student ID: 400413494_400411261

Report:

Explaining Assembly.s code:

The purpose of this code is to compute the sum of the square roots of the squares of pairs of 

single-precision floating-point values. 

1.The li instruction loads an immediate value into a register. In this case, it sets the stack pointer (sp)

 to 0x3C00.

2.The addi instruction computes the address of the global pointer (gp) by adding an immediate value (392) 

to the stack pointer.

3.The loop label indicates the start of a loop.

4.The loop label indicates the start of a loop.

  flw loads single-precision floating-point values from memory into registers f1 and f2.

  fmul.s multiplies the values in f1 and f2, storing the result in f10.

  fadd.s adds the values in f10 and f20, storing the result in f30.

  fsqrt.s computes the square root of f30 and stores it in x3.

  fadd.s adds the value in f0 with f3.

Fixed-Point Unit Module:

 Parameters:

  1.WIDTH: Bit width (default is 32 bits).

  2.FBITS: Number of fractional bits (default is 10).

 Inputs:

  1.clk: Clock signal.

  2.reset: Reset signal.

  3.operand_1: First operand (signed or unsigned).

  4.operand_2: Second operand (signed or unsigned).

  5.operation: Control signal for the desired operation (addition, subtraction, multiplication, or square 

  root).

 Outputs:
  
  1.result: Result of the operation.

  2.ready: Signal indicating when the result is valid.

  3.The case statement handles different operations based on the operation input.

  4.The always @(posedge reset) block resets the ready signal.

  5.The root and product signals are placeholders for the square root and multiplication results. 

Square Root Circuit :

 1. root

  This signal is declared as reg [WIDTH - 1 : 0] root;.

  It  represents the result of the square root calculation.

  The width of root is determined by the WIDTH parameter (default is 32 bits).

 2. root_ready 

   This signal is declared as reg root_ready;.

   It indicates when the square root result is ready or valid.

 3.module sqrt_subtraction

   Inputs:

    radicand: A 16-bit input representing the value for which we want to find the square root.

   Outputs:
    root: An 8-bit output representing the approximate square root of the input.

    Here’s a step-by-step explanation of the code:

    The always @(*) block indicates that this is a combinational logic block that updates whenever any of 
    
    its inputs change.

    The remainder variable is initialized to the value of radicand.

    The root_reg variable is also initialized to zero.

    The loop iterates from i = 0 to i = 7.

    Inside the loop:

    If remainder is greater than or equal to 2 * root_reg, it subtracts 2 * root_reg from remainder and 
    
    increments root_reg.

    Finally, root_reg is shifted left by one bit (effectively multiplying it by 2).

    The final value of root_reg represents the approximate square root of the input.

Multiplier multiplier_circuit:
 
 Inputs:
   .operand_1(multiplierCircuitInput1)

   .operand_2(multiplierCircuitInput2)

    operand_1: First operand (16 bits wide).

    operand_2: Second operand (also 16 bits wide).

  Outputs:
    
    .product(multiplierCircuitResult)

     product: Result of the multiplication (32 bits wide).
  
  Partial Products:

     reg     [31 : 0] partialProduct1;

    reg     [31 : 0] partialProduct2;

    reg     [31 : 0] partialProduct3;

    reg     [31 : 0] partialProduct4;

     The partialProduct1, partialProduct2, partialProduct3, and partialProduct4 signals are declared as 

     32-bit registers.

     These represent intermediate results during the multiplication process.

 module multiplier_32bit :

  Module Declaration:

    The module is named multiplier_32bit.

    It has three ports:

      A and B are 32-bit inputs.

    product is a 64-bit output.

    Wires:

    The module defines several wires:

    Ah, Al, Bh, and Bl are 32-bit wires. 

    partial_product1, partial_product2, partial_product3, and partial_product4 are 64-bit wires. 

  Segment Splitting:

    The input vectors A and B are split into high and low segments:

    {Ah, Al} = A extracts the high (Ah) and low (Al) parts of A.

    {Bh, Bl} = B extracts the high (Bh) and low (Bl) parts of B.

  Partial Products:

    Four partial products are calculated:

    partial_product1 = Ah * Bh

    partial_product2 = Ah * Bl

    partial_product3 = Al * Bh

    partial_product4 = Al * Bl

  Combination of Partial Products:

    The always @(*) block computes the final product:

    partialProduct1 is assigned the value of partial_product4 (which is Al * Bl).

    partialProduct2 is left-shifted by 16 bits.

    partialProduct3 is left-shifted by 32 bits.

    partialProduct4 is left-shifted by 48 bits.

    The product output is the sum of these partial products.

    waveforms:
    
    
![1](https://github.com/Rozhaha/LUMOS/assets/159628882/6b754613-d6fd-4bde-aded-34a025e1e6ee)


![2](https://github.com/Rozhaha/LUMOS/assets/159628882/b4a72091-1926-4426-84f9-a962474a8b00)

![3](https://github.com/Rozhaha/LUMOS/assets/159628882/a7c94be1-5307-4ec3-9248-1eca5368c020)

![4](https://github.com/Rozhaha/LUMOS/assets/159628882/c1280c32-bb7d-49a2-ab2a-7970105b14af)



