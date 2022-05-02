//NAME: SHAHBAZ HASSAN KHAN MALIK
//LAB 7

`timescale 1ns/10ps
`define MONITOR_STR_1 " MONITOR: %d: ADDRESS=%d, CS=%d, OE=%d, WS=%d |DATA_OUT=%d  DATA_IN=%d"
`define MONITOR_STR_2 " MONITOR: %d: ADDRESS=%d, CS=%d, OE=%d, WS=%d |DATA_OUT=%b  DATA_IN=%b"

module regfile_tb();
parameter WIDTH=8;
parameter DEPTH=5;
reg OE, CS, WS;
reg [DEPTH-1 : 0] ADDR_inst;
wire [WIDTH-1 : 0] DATA_2;
reg [WIDTH-1 : 0] DATA_1;
integer i, j;

//we are doing this step because of we have a bi-directional port
assign DATA_2 = (!OE && !CS) ? DATA_1:8'bz; 

regfile RAM1(DATA_2, ADDR_inst, OE, CS, WS);

initial begin
$vcdpluson;
$monitor(`MONITOR_STR_1, $time, ADDR_inst, CS, OE, WS, DATA_2, DATA_1);
end


initial begin
#15 CS=0; OE=0; //initialize

//PART A: WRITE
$display("\n PART A: WRITE");
for(i=0;i<25;i=i+1) begin
#15 $monitoroff; 
WS=0; DATA_1=i; ADDR_inst=i;
#15 $monitoron; 
WS=1;
end

//PART B_1: INDIVIDUAL READ
#15 $display("\n PART B_1: INDIVIDUAL READ");
#15 CS=0; OE=1; WS=0; ADDR_inst=3;

//PART B_2: BLOCK READ
#20 $monitoroff;
#15 $display("\n PART B_2: BLOCK READ");
for(i=0;i<25;i=i+1) begin
$strobe("at address: %d, value is: %d", i,regfile.memory[i]);
#15 ADDR_inst=i;
end

//PART D: HIGH IMPEDANCE TEST
#15 $display("\n PART D: HIGH IMPEDANCE TEST");
#15 CS=1; $monitoron;


//PART E: OUTPUT WALKING ONES
//INPUT WALKING ONES (WRITE)
#15 $monitoroff;
#15 $display("\n PART E: WALKING ONES [WRITE]");
#15 CS=0; j=1; OE=0;
for(i=0; i<8; i=i+1) begin
#15 WS=0; ADDR_inst=i; DATA_1=j;
#15 WS=1; j=j*2;
$strobe(`MONITOR_STR_2, $time, ADDR_inst, CS, OE, WS, DATA_2, DATA_1);
end
#15 $display("\n PART E: WALKING ONES [READ]");
#15 $monitoroff; OE=1; CS=0; WS=0;
#15 for(i=0; i<8; i=i+1) begin
#15 ADDR_inst=i;
$strobe(`MONITOR_STR_2, $time, ADDR_inst, CS, OE, WS, DATA_2, DATA_1);
end

#50 $finish;


end



endmodule
