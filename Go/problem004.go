package main

import "fmt"

func reverseNum(x int) int {
	reversed,temp := 0, x
	for ; temp > 0; {
		reversed = (reversed * 10) + (temp % 10)
		temp = temp / 10
	}
	return reversed
}

func isPalindrome(x int) bool {
	return x == reverseNum(x)
}

func largestPalProduct() int {
	largest := 0
	for i := 100; i < 1000; i++ {
		for j := 100; j < 1000; j++ {
			prod := i*j
			if(isPalindrome(prod) && prod > largest) {
				largest = prod
			}
		}
	}
	return largest
}

func main() {
	fmt.Println(largestPalProduct())
}