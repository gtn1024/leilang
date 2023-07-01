package main

import (
	"flag"
	"fmt"
	"lei/repl"
	"os"
	"os/user"
)

var BuildVersion = ""

func main() {
	var version bool
	flag.BoolVar(&version, "v", false, "version")
	flag.Parse()
	if version {
		fmt.Printf("Lei lang\n")
		fmt.Printf("Copyright (C) 2023 Taoning Ge\n")
		fmt.Printf("Build version: %s\n", BuildVersion)
		return
	}

	user, err := user.Current()
	if err != nil {
		panic(err)
	}
	fmt.Printf("Hi %s! This is the Lei Lang!\n", user.Name)
	fmt.Printf("Feel free to type in commands\n")
	repl.Start(os.Stdin, os.Stdout)
}
