FILE ?= tt_um_cejmu

convert: $(FILE).sv
	yosys -p 'read_verilog -sv *.sv; proc; hierarchy -top $(FILE); write_verilog $(FILE).v;'
