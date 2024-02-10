all: hvcc plugins

PLUGINS = delay_simple synth_simple


features: hvcc
	$(foreach var, $(PLUGINS), make -C $(var)/ features;)

plugins: hvcc
	$(foreach var, $(PLUGINS), make -C $(var)/ $(MAKECMDGOALS);)
	mkdir bin
	$(foreach var, $(PLUGINS), mv $(var)/bin/* bin/;)

hvcc:
	$(foreach var, $(PLUGINS), hvcc dpf_$(var).pd -n $(var) -m dpf_$(var).json -o $(var) -g dpf -p examples -p examples/heavylib;)
