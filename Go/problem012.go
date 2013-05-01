package main

import (
	"fmt"
)

func findDivisibleTriangleNumber() int {
	num, dcount := 1,0
	for i := 2; dcount <= 200; i++ {
		num = num + i
		dcount = divisorCount(num)
	}
	return num
}

func main() {
	fmt.Println(findDivisibleTriangleNumber())
	//fmt.Println(divisorCount(28))
}