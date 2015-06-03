.PHONY: test

test:
	PERL6LIB=lib prove --exec perl6 -r t
