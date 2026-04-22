.PHONY: all desmos clean distclean

LATEXMK = latexmk
LATEXFLAGS = -f -pdf -interaction=nonstopmode -halt-on-error -file-line-error

DESMOS_MAIN = desmos
DESMOS_TEX = $(DESMOS_MAIN)/*.tex

UNIT1_MAIN = unit1_function_analysis
UNIT1_TEX = $(UNIT1_MAIN)/*.tex

UNIT11_MAIN = unit11_univariate_distributions
UNIT11_TEX = $(UNIT11_MAIN)/*.tex

all: desmos unit1 unit11

desmos: $(DESMOS_MAIN)
	mkdir -p build/desmos
	$(LATEXMK) $(LATEXFLAGS) -outdir=build/desmos $(DESMOS_TEX)

unit1: $(UNIT1_MAIN)
	mkdir -p build/$(UNIT1_MAIN)
	$(LATEXMK) $(LATEXFLAGS) -outdir=build/$(UNIT1_MAIN) $(UNIT1_TEX)

unit11: $(UNIT11_MAIN)
	mkdir -p build/$(UNIT11_MAIN)
	$(LATEXMK) $(LATEXFLAGS) -outdir=build/$(UNIT11_MAIN) $(UNIT11_TEX)

clean:
	$(LATEXMK) -c $(DESMOS_MAIN)
	rm -rf build

distclean:
	$(LATEXMK) -C $(DESMOS_MAIN)
	rm -rf build