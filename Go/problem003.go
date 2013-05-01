package main

import "fmt"

func primeFactors(x uint64) []uint64 {
	factors := []uint64{}
	for i := uint64(2); i <= x / i; i++ {
		for ; x % i == 0; {
			factors = append(factors, i)
			x /= i
		}
	}
	if(x > 1) {
		factors = append(factors, x)
	}
	return factors
}

func max(x []uint64) uint64 {
	largest := uint64(0)
	for _,e := range x {
		if e > largest {
			largest = e
		}
	}
	return largest
}

func main() {
	fmt.Println(max(primeFactors(600851475143)))
}