package main

import "fmt"

func fibSumLessThan(maxFib int) int {
	fibSum := 0
	prev := 1
	curr := 2

	for ; curr < maxFib; {
		if curr % 2 == 0 {
			fibSum += curr	
		}
		tempCurr := curr
		curr = prev + curr
		prev = tempCurr
	}

	return fibSum
}

func main() {
	fmt.Println(fibSumLessThan(4000000))
}