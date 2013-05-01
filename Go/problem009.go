package main

import "fmt"

func isPythagTriplet(x,y,z int) bool {
	return (x*x) + (y*y) == (z*z)
}

func findLargetPythagProduct() int {
	for i := 999; i > 0; i-- {
		for j := i-1; j > 0; j-- {
			for k := j-1; k >0; k-- {
				if(k+j+i == 1000 && isPythagTriplet(k,j,i)) {
					return k*j*i
				}
			}
		}
	}
	return 0
}

func main() {
	fmt.Println(findLargetPythagProduct())
}