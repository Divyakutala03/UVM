class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  seq_item seq;
  virtual alu_interface intf;
  
  uvm_analysis_port #(seq_item) ap;
  
  //New 
  function new(string name="monitor",uvm_component parent);
    super.new(name,parent);
    ap=new("ap",this);
    `uvm_info("[MON]","Monitor Constructor",UVM_MEDIUM)
  endfunction
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("[MON]","Monitor Build Phase",UVM_MEDIUM)
    if(!(uvm_config_db #(virtual alu_interface)::get(this,"","intf",intf)))
      `uvm_error("[MON]","Interface failed to get config DB");
  endfunction
  //Run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("[MON]","Monitor Run Phase",UVM_MEDIUM)
    forever
      begin
        seq=seq_item::type_id::create("seq");
        wait(!intf.reset)
        @(posedge intf.clock)
        seq.A = intf.A;
        seq.B = intf.B;
        seq.reset = intf.reset;
        seq.alu_seq = intf.alu_seq;
        @(posedge intf.clock)
        seq.alu_out = intf.alu_out;
        seq.carryout = intf.carryount;
        ap.write(seq);
      end
  endtask
endclass
