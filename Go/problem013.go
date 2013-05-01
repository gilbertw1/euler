package main

import (
	"fmt"
	"os"
	"bufio"
	"strconv"
)

func readNumbers() []float64 {
	nums := []float64{}
	f, _ := os.Open("problem013.txt")
	r := bufio.NewReader(f)
	l,_,e := r.ReadLine()
	for e == nil {
		fl,_ := strconv.ParseFloat(string(l), 64)
		nums = append(nums, fl)
		l,_,e = r.ReadLine()
	}
	return nums
}

func sum(nums []float64) float64 {
	sumVal := float64(0)
	for _,n := range nums {
		sumVal += n
	}
	return sumVal
}

func main() {
	sumVal := sum(readNumbers())
	sumStr := strconv.FormatFloat(sumVal, 'g', 15, 64)
	fmt.Println(sumStr)
}