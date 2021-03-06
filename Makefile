# Set your environment variables here
PWD = $(shell pwd)
TEST_REPORTER ?= dot
TEST_PORT ?= 8080
TEST_TIMEOUT ?= 4000
TEST_SLOW ?= 2000
NODE_MODULES = $(PWD)/node_modules

# XXX: below may be a bit too clever
PID_FILE := $(PWD)/$(shell echo ".test-server-pid.$$RANDOM")

make-pid-file:
	@echo "$RANDOM" > $(PID_FILE) ; \
	cd $(PWD)

# If you need a local test server, fire this
fixture-server:
	@cd tests/cucumber/fixtures ; \
		$(NODE_MODULES)/.bin/http-server -s -p $(TEST_PORT) & \
		echo "$$!" > $(PID_FILE) ; \
		cd $(PWD)

# SOME TASK EXAMPLES FOR YOUR REFERENCE
#
# test: fixture-server
# 	@$(NODE_MODULES)/.bin/mocha tests/test --recursive \
# 			--globals define \
# 			--timeout $(TEST_TIMEOUT) --slow $(TEST_SLOW) \
# 			-R $(TEST_REPORTER) $(TEST_ARGS) ; \
# 		STATUS=$$? ; \
# 		kill -9 `cat $(PID_FILE)` ; rm $(PID_FILE) ; \
# 		exit $$STATUS

# cucumber.js: fixture-server
# 	@TEST_PORT=$(TEST_PORT) $(NODE_MODULES)/.bin/cucumber.js \
# 			-f pretty \
# 			examples/cucumber/features \
# 			--require examples/cucumber/features/steps \
# 			--require examples/cucumber/features/support ; \
# 		STATUS=$$? ; \
# 		kill -9 `cat $(PID_FILE)` ; rm $(PID_FILE) ; \
# 		exit $$STATUS
#
#

example_cucumber_test:  fixture-server
	@TEST_PORT=$(TEST_PORT) $(NODE_MODULES)/.bin/cucumber.js \
			-f pretty \
			examples/cucumber/features/ \
			--require examples/cucumber/features/steps \
			--require examples/cucumber/features/support ; \
		STATUS=$$? ; \
		kill -9 `cat $(PID_FILE)` ; rm $(PID_FILE) ; \
		exit $$STATUS



# May need to modify symbolic link in the .bin directory
cucumber-colors: fixture-server
		@TEST_PORT=$(TEST_PORT) $(NODE_MODULES)/.bin/cucumber-colors.js \
			-f pretty \
			tests/cucumber/features/ \
			--require tests/cucumber/features/steps \
			--require tests/cucumber/features/support ; \
		STATUS=$$? ; \
		kill -9 `cat $(PID_FILE)` ; rm $(PID_FILE) ; \
		exit $$STATUS	

cucumber: fixture-server
	@TEST_PORT=$(TEST_PORT) $(NODE_MODULES)/.bin/cucumber.js \
			-f pretty \
			tests/cucumber/features/ \
			--require tests/cucumber/features/steps \
			--require tests/cucumber/features/support ; \
		STATUS=$$? ; \
		kill -9 `cat $(PID_FILE)` ; rm $(PID_FILE) ; \
		exit $$STATUS		

.PHONY: example_cucumber_test fixture-server make-pid-file cucumber
