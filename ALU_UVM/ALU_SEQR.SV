class seqr extends uvm_sequencer #(seq_item);
  `uvm_component_utils(seqr)
  //New Constructor
  function new(string name="seqr",uvm_component parent);
    super.new(name,parent);
    `uvm_info("[SEQR]","ALU_Seqr in Constructor",UVM_MEDIUM)
  endfunction
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("[SEQR]","ALU_Seqr in Build phase",UVM_MEDIUM)
  endfunction
endclass
    
