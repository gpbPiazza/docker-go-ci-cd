#-----------------------------------------#
# MAKE VARIABLES
#-----------------------------------------#
GOTEST ?= go test
COVER_DIR ?=  ./.cover
FILE_COVER ?= coverage.out
COVER_ENTRY ?= ./...
#-----------------------------------------#
# RUN COMMANDS
#-----------------------------------------#
.PHONY: run/local 
run/local: 
	go run main.go

.PHONY: run/ci-test
run/ci-test: setup/cover
	@echo "Running all unit tests"		
	$(GOTEST) -failfast -v -p 2  ./src/...  \
		-coverpkg=${COVER_ENTRY} \
		-covermode=atomic \
		-coverprofile=${COVER_DIR}/${FILE_COVER}

.PHONY: run/local-test
run/local-test:
	@echo "Running all unit tests"		
	$(GOTEST) -cover -p  2 -v ./src/...

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
.PHONY: setup/cover
setup/cover:
	@rm -rf ${COVER_DIR}
	@mkdir -p ${COVER_DIR}

.PHONY: coverage
coverage: 
	go tool cover -func=${COVER_DIR}/${FILE_COVER}
