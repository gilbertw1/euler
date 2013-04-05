;; Prime Functions

(declare ldpf primes prime?)

(defn ldp [n]
	(ldpf primes n))

(defn prime? [n]
	(cond 
		(< n 1) (throw (Exception. "Not a positive Integer"))
		(= n 1) false
		:else (= (ldp n) n)))

(defn ldpf [[x & xs] n]
	(cond 
		(= (rem n x) 0) x
		(> (* x x) n) n
		:else (ldpf xs n)))

(def primes
	(cons 2 (filter prime? (iterate inc 3))))

;; End Prime Functions

;; factors :: (Integral a) => a -> [a]
;; factors n 
;;         | n < 1	    = error "This is not a positive Integer!!"
;;         | n == 1	= []
;;         | otherwise = p : factors (div n p) where p = ldp n

(defn factors [n]
	(cond
		(< n 1) (throw (Exception. "Not a positive Integer"))
		(= n 1) []
		:else 
			(let [p (ldp n)]
				(cons p (factors (/ n p))))))

(defn power-set [s]
  (reduce (fn [ss x] (concat ss (map #(conj % x) ss))) [#{}] s))

(defn divisors [x]
	(->>
		x
		(factors)
		(power-set)
		(distinct)
		(map #(reduce * %))
		(remove #(= x %))))