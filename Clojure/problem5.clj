;; INEFFICIENT: ~9s

(defn divides-all [num]
	(loop [val 20]
		(cond
			(= val 0) true
			(not= (mod num val) 0) false
			:else (recur (dec val)))))

(defn smallest-divides-all []
	(loop [num 1]
		(if
			(divides-all num) num
			(recur (inc num)))))

(println (smallest-divides-all))