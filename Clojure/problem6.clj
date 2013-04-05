(defn sum-of-squares [x]
	(loop [num x sum 0]
		(if (= num 0)
			sum
			(recur (dec num) (+ sum (* num num))))))

(defn square-of-sum [x]
	(let [sum (reduce + (range 1 (inc x)))]
		(* sum sum)))

(defn diff-sumsq-sqsum [x]
	(- (square-of-sum x) (sum-of-squares x)))

(println (diff-sumsq-sqsum 100))