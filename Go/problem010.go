package main

import "fmt"

func sum(nums []int) uint64 {
	sum := uint64(0)
	for _,e := range nums {
		sum += uint64(e)
	}
	return sum
}

func main() {
	fmt.Println(sum(AtkinSieve(2000000)))
}