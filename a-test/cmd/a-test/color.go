//go:build color

package main

// Built by `brew install --with-color`: print the message in green.
func init() {
	message = "\033[32m" + message + "\033[0m"
}
