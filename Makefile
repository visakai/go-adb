.PHONY: all test generate get-deps

all: get-deps generate test

test:
	go test -v -race ./...

generate:
	# stringer requires the packages to be installed.
	go install -v golang.org/x/tools/cmd/stringer@latest
	go generate -x ./...

get-deps:
	go mod tidy
