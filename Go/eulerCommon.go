package main

import "math"

func divisorCount(x int) int {
	powers := []int{}
	factors := primeFactors(x)
	if len(factors) < 1 {
		return 0
	}
	last, cnt := factors[0], 1

	for i := 1; i < len(factors); i++ {
		curr := factors[i]
		if last != curr {
			powers = append(powers, cnt)
			last, cnt = curr, 1
		} else {
			cnt++
		}
	}
	powers = append(powers, cnt)
	return product(powers)
}

func product(nums []int) int {
	prod := 1
	for _,n := range nums {
		prod *= n+1
	}
	return prod
}

func primeFactors(x int) []int {
	pfactors := []int{}
	acc := x
	primes := AtkinSieve(x/2)
	for i := 0; i < len(primes); i++ {
		if acc % primes[i] == 0 {
			pfactors = append(pfactors, primes[i])
			acc = acc / primes[i]
			i--
		}
		if acc == 1 {
			break
		}
	}
	return pfactors
}

// Sieve of Atkin
func AtkinSieve(x int) []int {
	limit, lsqrt := x, int(math.Sqrt(float64(x)))
	if limit < 3 {
		limit = 3
	}
	sieve := make([]bool, limit+1)

	sieve[0] = false
	sieve[1] = false
	sieve[2] = true
	sieve[3] = true

	for i := 1; i <= lsqrt; i++ {
		for j := 1; j <= lsqrt; j++ {
			n := (4*i*i) + (j*j)
			
			if n <= limit && (n % 12 == 1 || n % 12 == 5) {
				sieve[n] = !sieve[n]
			}

			n = (3*i*i) + (j*j)
			if n <= limit && n % 12 == 7 {
				sieve[n] = !sieve[n]
			}

			n = (3*i*i) - (j*j)
			if i > j && n <= limit && (n % 12 == 11) {
				sieve[n] = !sieve[n]
			}
		}
	}

	for i := 5; i <= lsqrt; i++ {
		if(sieve[i]) {
			n := i*i
			for j := n; j <= limit; j += n {
				sieve[j] = false
			}
		}
	}

	primes := []int{}
	for i,e := range sieve {
		if e { 
			primes = append(primes, i)
		}
	}

	return primes
}