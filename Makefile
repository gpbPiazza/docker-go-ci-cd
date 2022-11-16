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


# $(words $(gofmt_files))

gofmt_files := $(shell gofmt -l .)
run/check-gofmt:
ifneq ($(words $(gofmt_files)), 0)
	$(error "Run "gofmt -w ." because there are go files not properly formatted: \n$(shell gofmt -l .)")
else
	$(info "All go files are properly formatted.")
endif
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
