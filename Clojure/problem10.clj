(load "euler-common")

(defn sum-primes-below [x]
	(reduce + (take-while #(< % x) primes)))

(println (sum-primes-below 2000000))