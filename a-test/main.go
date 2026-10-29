// a-test is a tiny CLI used to test this tap's bottle and build-from-source
// installs.
package main

import (
	"flag"
	"fmt"
)

// version is set at build time with -ldflags "-X main.version=<version>".
var version = "dev"

func main() {
	showVersion := flag.Bool("version", false, "print the version and exit")
	flag.Parse()

	if *showVersion {
		fmt.Println(version)
		return
	}
	fmt.Println("install succeed")
}
