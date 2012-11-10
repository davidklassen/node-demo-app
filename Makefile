REPORTER=spec
TESTS=$(shell find ./tests -type f -name "*.js")

test:
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--require should \
		--reporter $(REPORTER) \
		$(TESTS)
		
test-cov: app-cov
	@APP_COV=1 $(MAKE) --quiet test REPORTER=html-cov > coverage.html
	
app-cov:
	@jscoverage app app-cov
		
.PHONY: test

