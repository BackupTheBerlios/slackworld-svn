WEBROOT=`pwd`
STYLEDIR=share/xsl
DWSTYLEDIR=/usr/share/xml/docbook/website/xsl

all:
	make website

include website.depends

autolayout.xml: layout.xml
	xsltproc --output $@ $(DWSTYLEDIR)/autolayout.xsl $<
	make depends

depends: autolayout.xml
	xsltproc  \
	--output website.depends \
	$(DWSTYLEDIR)/makefile-dep.xsl  \
	$<

%.html: autolayout.xml
	echo "Generating $@"
	xsltproc \
	--output $@ \
	--stringparam autolayout-file $(WEBROOT)/autolayout.xml \
	$(STYLEDIR)/website.xsl \
	$(filter-out autolayout.xml,$^)
	-tidy -i -m -q $@ &> /dev/null 

.PHONY: clean
