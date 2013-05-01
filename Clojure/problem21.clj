(load-file "euler-common.clj")

(defn divisor-sum [x]
	(reduce + (divisors x)))

(defn divisor-sum-map [nums]
	(zipmap nums (map divisor-sum nums)))

(defn amicable-pair [dsmap x]
	(let [a (dsmap x)]
		(if (and (= x (dsmap a)) (not= x a)) [x a] nil)))

(defn amicable-sum [nums]
	(let [dsmap (divisor-sum-map nums)]
		(loop [[fst & rest] nums acc #{}]
			(println acc)
			(if (nil? fst)
				(apply + acc)
				(recur rest (set (concat acc (amicable-pair dsmap fst))))))))

(println (amicable-sum (range 2 10000)))