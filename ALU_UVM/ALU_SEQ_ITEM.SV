class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)
  // Inputs--Instantiation
  rand bit [7:0] A;
  rand bit [7:0] B;
  rand bit reset;
  rand bit [3:0] alu_sel;
  // Outputs 
  logic [7:0] alu_out;
  bit carryout;
  //New Constructor
  function new(string name="seq_item");
    super.new(name);
    `uvm_info("[SEQ_ITEM]","ALU_Seqitem in Constructor",UVM_MEDIUM)
  endfunction
  // Default constraints
  constraint A_c { A inside {[10:20]};}
  constraint B_c { B inside {[0:10]};}
  constraint SEL { alu_sel inside {[0:3]};}
endclass
