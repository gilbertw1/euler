(load "euler-common")

(defn largest-prime-factor [x]
	(->>
		x
		(factors)
		(filter prime?)
		(apply max)))

(println (largest-prime-factor 600851475143))