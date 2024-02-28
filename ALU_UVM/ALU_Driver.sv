class driver extends uvm_driver #(seq_item);
  `uvm_component_utils(driver)
  
  seq_item seq;
  virtual alu_interface intf;
  
  //New Constructor
  
  function new(string name="driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("[DRV]","Driver in Constructor",UVM_MEDIUM)
  endfunction
  //Build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("[DRV]","Driver in build phase",UVM_MEDIUM)
    if(!(uvm_config_db #(virtual alu_interface)::get(this,"","intf",intf)))
      `uvm_error("[DRV]","Interface failed to get config DB");
  endfunction
  //Run phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("[DRV]","Driver in Run Phase",UVM_MEDIUM)
    forever
      begin
        seq=seq_item::type_id::create("seq");
        seq_item_port.get_next_item(seq);
        drive(seq);
        seq_item_port.item_done(seq);
      end
  endtask
  //Task Drive
  task drive(seq_item seq);
    @(posedge intf.clock)
    intf.A <= seq.A;
    intf.B <= seq.B;
    intf.reset <= seq.reset;
    intf.alu_seq <= seq.alu_seq;
  endtask
endclass
