all: hvcc plugins

PLUGINS = delay_simple synth_simple reverb_simple delay_simple_nanovg synth_simple_nanovg reverb_simple_nanovg


features: hvcc
	$(foreach var, $(PLUGINS), make -C $(var)/ features;)

plugins: hvcc
	$(foreach var, $(PLUGINS), make -C $(var)/ $(MAKECMDGOALS) DPF_BUILD_DIR=$(CURDIR)/build/$(var) DPF_TARGET_DIR=$(CURDIR)/bin;)

hvcc:
	$(foreach var, $(PLUGINS), hvcc dpf_$(var).pd -n $(var) -m dpf_$(var).json -o $(var) -g dpf -p examples -p examples/heavylib --gui;)
