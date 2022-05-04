# Register File Model
## Shahbaz Hassan Khan Malik

### Theory:
A register file operates similarly to random access memory but is made from flipflops rather than 
DRAM or SRAM cells. A register file would consume far more power and take far more area 
than a true memory of the same capacity. However, register files have the advantages of 
operating fast, faster even than SRAM, and they can easily be coded in any arbitrary size (width 
and depth) in Verilog. 

Features:
1.  The memory has an eight bit bi-directional data bus.  
2.  The memory has a five bit address bus.   
3.  The output enable (oe) signal is active high.   
4.  Chip select (cs) is active low.   
5.  The value on the data bus is written to the address on the address bus on the rising edge 
of the write strobe (ws) if the output is not enabled.   
6. The contents of the currently specified address are placed on the data bus when oe is 
high.
7. Block read: as long as oe remains high, the contents of the newly specified address are 
placed on the data bus. 
8. The data bus returns to the high impedance state after oe goes low.    
9. The chip select signal, cs, must be low to read or write. If it’s high, oe, and 
ws are ignored and the data bus remains in the high impedance state.      

<img width="666" alt="Screen Shot 2022-05-04 at 1 37 20 PM" src="https://user-images.githubusercontent.com/98668171/166821668-dbe2e6ea-4070-4388-adeb-365ef43cf76c.png">
