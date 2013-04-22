(defn sum-digits [x]
	(loop [left x sum 0]
		(if (< left 10)
			(+ sum left)
			(recur (.divide left (BigInteger/TEN)) (+ sum (mod left 10))))))

(println (sum-digits (.pow (.toBigInteger (bigint 2)) 1000)))