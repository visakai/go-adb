.PHONY: test generate get-deps

test: generate
	go test -v -race ./...

generate:
	# stringer requires the packages to be installed.
	go install -v golang.org/x/tools/cmd/stringer@latest
	go generate -x ./...

get-deps:
	go get -t -v ./...
	go get -u golang.org/x/tools/cmd/stringer
