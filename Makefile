PROGRAMS=mkfilter mkshape mkaverage gencode #genplot

all: $(PROGRAMS)

CFLAGS= -O2 -g -Wall -Wno-unused-function
LDFLAGS= -Wl
OBJDIR=obj
SRCDIR=src

mkfilter: $(OBJDIR)/mkfilter.o $(OBJDIR)/complex.o
	clang++ $(LDFLAGS) $+ -o $@ -lm

mkshape: $(OBJDIR)/mkshape.o $(OBJDIR)/complex.o
	clang++ $(LDFLAGS) $+ -o $@ -lm

mkaverage: $(OBJDIR)/mkaverage.o $(OBJDIR)/complex.o
	clang++ $(LDFLAGS) $+ -o $@ -lm

gencode: $(OBJDIR)/gencode.o $(OBJDIR)/complex.o $(OBJDIR)/readdata.o
	clang++ $(LDFLAGS) $+ -o $@ -lm

genplot: $(OBJDIR)/genplot.o $(OBJDIR)/complex.o $(OBJDIR)/readdata.o
	clang++ $(LDFLAGS) $+ -o $@ -lgd -lm

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	clang++ -o $@ -c $+ $(CFLAGS) $(PKG_CONFIG_CFLAGS)

clean:
	rm -fv $(PROGRAMS)
	rm -rf $(OBJDIR)

