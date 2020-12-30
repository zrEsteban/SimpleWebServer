USER:= /home/pi
ROOT := $(USER)/WebServer
PUB_FOLDER:= $(ROOT)/www
PAGES_FOLDER:= $(PUB_FOLDER)/pages
ORG_FOLDER:= $(ROOT)/org

PORT:= 80

list_process:
	ps -fA | grep python

lunch:
	./lunch_webserver.sh $(PORT) www/ > webserver.log

index_bkup:
	mv $(PUB_FOLDER)/index.html $(PUB_FOLDER)/index_old.html

replace:
	cp $(PUB_FOLDER)/OrgReveal/reveal_present.html $(PUB_FOLDER)/index.html

index:
	make index_bkup
	emacs $(ORG_FOLDER)/index.org --batch -f org-html-export-to-html --kill
	mv $(ORG_FOLDER)/index.html $(PUB_FOLDER)/index.html

default_page:
	cp $(PUB_FOLDER)/index_default.html $(PUB_FOLDER)/index.html

chartjs_page:
	cp $(PUB_FOLDER)/index_chartjs.html $(PUB_FOLDER)/index.html

clean:
	-rm -ir $(ROOT)/*~
	-rm -ir $(PUB_FOLDER)/*~
	-rm -ir $(PAGES_FOLDER)/*~
	-rm -ir $(ORG_FOLDER)/*~
