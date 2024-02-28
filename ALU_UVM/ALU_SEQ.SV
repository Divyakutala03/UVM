class base_seq extends uvm_sequence #(seq_item);
  `uvm_object_utils(base_seq)
  
  seq_item reset_seq;
  
  //New Constructor
  
  function new(string name="base_seq");
    super.new(name);
    `uvm_info("[SEQ]","ALU_Seq  Reset in Constructor",UVM_MEDIUM)
  endfunction
  
  //Task body
  
  task body();
    `uvm_info("[SEQ]","ALU_Seq  Reset in task body",UVM_MEDIUM);
    reset_seq=seq_item::type_id::create("reset_seq");
    start_item(reset_seq);
    reset_seq.randomize() with {reset==1;};
    finish_item(reset_seq);
  endtask
  
endclass

class seq extends base_sequence;
  `uvm_object_utils(seq)
  
  seq_item s;
  
  //new constructor
  function new(string name="seq");
    super.new(name);
    `uvm_info("[SEQ]","ALU_Seq in constructor",UVM_MEDIUM)
  endfunction
  //task body
  task body();
    `uvm_info("[SEQ]","ALU_Seq in Task body",UVM_MEDIUM)
    s=seq_item::type_id::create("s");
    start_item(s);
    s.randomize() with {reset==0;};
    finish_item(s);
  endtask
    
endclass

    
