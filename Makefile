#-----------------------------------------#
# MAKE VARIABLES
#-----------------------------------------#
GOTEST ?= go test


#-----------------------------------------#
# RUN COMMANDS
#-----------------------------------------#
.PHONY: run/local 
run/local: 
	go run main.go

.PHONY: run/test
run/test:
	@echo "Running all unit tests"
	$(GOTEST) -cover -p 2 -v ./...

#-----------------------------------------#
# BUILD COMMANDS
#-----------------------------------------#
.PHONY: build
build:
	go build

#-----------------------------------------#
# CORAVERAGE COMMANDS
#-----------------------------------------#
.PHONY: coverage/unit
coverage/unit: 
	@echo "Making coverage report..."
	$(GOTEST) -cover -p 2 -v ./...





