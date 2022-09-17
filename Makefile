all: hvcc plugins

PLUGINS = delay_simple

plugins: hvcc
	$(foreach var, $(PLUGINS), make -C $(var)/ features)
	$(foreach var, $(PLUGINS), make -C $(var)/)

hvcc:
	$(foreach var, $(PLUGINS), hvcc dpf_$(var).pd -n $(var) -m dpf_$(var).json -o $(var) -g dpf -p examples)
