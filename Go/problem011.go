package main

import (
	"fmt"
	"os"
	"bufio"
	"strings"
	"strconv"
)

func convertRow(str string) []int {
	row := []int{}
	for _,e := range strings.Split(str, " ") {
		i,_ := strconv.Atoi(e)
		row = append(row, i)
	}
	return row
}

func readGrid() [][]int {
	grid := [][]int{}
	f, _ := os.Open("problem011.txt")
	r := bufio.NewReader(f)
	l,_,e := r.ReadLine()
	for e == nil {
		grid = append(grid, convertRow(string(l)))
		l,_,e = r.ReadLine()
	}
	return grid
}

func findLargestProduct(grid [][]int) int {
	largest := 0
	for i := 0; i < len(grid); i++ {
		for j := 0; j < len(grid[i]); j++ {
			prod := findProductFor(grid, i, j)
			if(prod > largest) {
				largest = prod
			}
		}
	}
	return largest
}

func max(nums []int) int {
	maxNum := 0
	for _,i := range nums {
		if i > maxNum {
			maxNum = i
		}
	}
	return maxNum
}

func findProductFor(grid [][]int, x,y int) int {
	dprod := getIndex(grid,x,y) * getIndex(grid,x+1,y) * getIndex(grid,x+2,y) * getIndex(grid,x+3,y)
	rprod := getIndex(grid,x,y) * getIndex(grid,x,y+1) * getIndex(grid,x,y+2) * getIndex(grid,x,y+3)
	dxprod := getIndex(grid,x,y) * getIndex(grid,x+1,y+1) * getIndex(grid,x+2,y+2) * getIndex(grid,x+3,y+3)
	uxprod := getIndex(grid,x,y) * getIndex(grid,x-1,y+1) * getIndex(grid,x-2,y+2) * getIndex(grid,x-3,y+3)
	prods := []int{dprod,rprod,dxprod,uxprod}
	return max(prods)
}

func getIndex(grid [][]int, x,y int) int {
	if x > 0 && y > 0 && len(grid) > x && len(grid[x]) > y {
		return grid[x][y]
	}
	return 0
}

func main() {
	grid := readGrid()
	fmt.Println(findLargestProduct(grid))
}