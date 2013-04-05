(defn sum-multiples []
	(loop [curr 1 sum 0]
		(cond
			(>= curr 1000) 
				sum
			(or (= (mod curr 5) 0) (= (mod curr 3) 0))
				(recur (+ curr 1) (+ sum curr))
			:else
				(recur (+ curr 1) sum))))

(println (sum-multiples))