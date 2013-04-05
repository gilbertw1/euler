(defn sum-even-fibs []
	(loop [curr 1 prev 1 sum 0]
		(let [next (+ curr prev)]
			(cond
				(> next 4000000) sum
				(even? next) (recur next curr (+ sum next))
				:else (recur next curr sum)))))

(println (sum-even-fibs))