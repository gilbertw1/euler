package main

import "fmt"

func sumOfSquares() uint64 {
	ss := uint64(0)
	for i := uint64(1); i <= uint64(100); i++ {
		ss += i*i
	}
	return ss
}

func squareOfSum() uint64 {
	ss := uint64(0)
	for i := uint64(1); i <= uint64(100); i++ {
		ss += i
	}
	return ss*ss
}

func main() {
	fmt.Println(squareOfSum() - sumOfSquares())
}