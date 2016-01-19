PLUGIN = ReifyCore.Interactive
HERM = hermit Tests.hs -v0 -opt=$(PLUGIN)

default: cont

raw:
	$(HERM) settings.hss prep.hss

cont:
	$(HERM) settings.hss prep.hss recipe.hss

done:
	echo "" | make cont ; echo

time:
	time make done

time3:
	make time
	make time
	make time

# herm:
# 	$(HERM) settings.hss

###

compile:
	cd .. ; make

compile-circat:
	cd ~/Tabula/Haskell/circat ; make
	make compile-monomorph

compile-extras:
	cd ~/Tabula/Haskell/hermit-extras ; make
	make compile-monomorph

compile-monomorph:
	cd ~/Haskell/monomorph ; make
	make compile
