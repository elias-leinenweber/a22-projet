C = dia
FLAGS = -t svg

rendu: README.md
	mkdir -p rendu/analyse
	mkdir -p rendu/conception
	cp README.md rendu/

analyse: rendu dcu.dia dca.dia
	$(C) $(FLAGS) dcu.dia
	$(C) $(FLAGS) dca.dia
	mv dcu.svg dca.svg rendu/analyse

conception: rendu ds-*.dia dcc.dia 
	$(C) $(FLAGS) ds-*.dia
	$(C) $(FLAGS) dcc.dia
	mv ds-*.svg dcc.svg rendu/conception

clean:
	rm -rf rendu/
