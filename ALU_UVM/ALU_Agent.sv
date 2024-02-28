class agent extends uvm_agent;
  `uvm_component_utils(agent)
  //Agent -- driver,monitor,sequencer
  seqr sqr;
  driver drv;
  monitor mon;
  //New constructor
  function new(string name="agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("[AGENT]","Agent constructor",UVM_MEDIUM)
  endfunction
  
  //Build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("[AGENT]","Agent Build phase",UVM_MEDIUM)
    sqr=seqr::type_id::create("sqr",this);
    drv=driver::type_id::create("drv",this);
    mon=monitor::type_id::create("mon",this);
  endfunction
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("[AGENT]","Agent connect phase",UVM_MEDIUM)
    //connecting driver and seqr
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction
  
endclass
    
