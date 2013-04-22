package main

import "fmt"

func sumMutiplesBelow(x int) int {
	sum := 0
	for x -= 1; x > 0; x-- {
		if(isMultipleThreeFive(x)) {
			sum += x
		}
	}
	return sum
}

func isMultipleThreeFive(x int) bool {
	return x % 3 == 0 || x % 5 == 0
}

func main() {
	fmt.Println(sumMutiplesBelow(1000))
}