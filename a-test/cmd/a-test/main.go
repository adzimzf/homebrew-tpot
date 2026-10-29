// a-test is a tiny CLI used to test this tap's bottle and build-from-source
// installs.
package main

import (
	"flag"
	"fmt"
)

// version is set at build time with -ldflags "-X main.version=<version>".
var version = "dev"

// message is what a-test prints; color.go colors it when built with
// -tags color.
var message = "install succeed"

func main() {
	showVersion := flag.Bool("version", false, "print the version and exit")
	flag.Parse()

	if *showVersion {
		fmt.Println(version)
		return
	}
	fmt.Println(message)
}
