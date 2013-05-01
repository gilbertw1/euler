(defn fact [x]
	(loop [n x f (BigInteger/ONE)]
		(if (= n 1)
			f
			(recur (- n 1) (* f n)))))

(defn sum-digits [x]
	(loop [left x sum 0]
		(if (< left 10)
			(+ sum left)
			(recur (.divide left (BigInteger/TEN)) (+ sum (mod left 10))))))

(println (sum-digits (.toBigInteger (fact (bigint 100)))))