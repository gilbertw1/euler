package main

import "fmt"

func dividesAll(x int) bool {
	for i := 20; i > 0; i-- {
		if(x % i != 0) {
			return false
		}
	}
	return true
}

func smallestDividesAll() int {
	for i := 2520; ; i+=20 {
		if(dividesAll(i)) {
			return i
		}
	}
	return 0
}

func main() {
	fmt.Println(smallestDividesAll())
}