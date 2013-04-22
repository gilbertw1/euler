(load "euler-common")

(defn triangle [x]
	(loop [curr x sum 0]
		(if (= curr 0)
			sum
			(recur (dec curr) (+ curr sum)))))

(defn divisor-count [x]
	(->>
		x
		factors
		power-set
		distinct
		count))

(defn find-triangle-divisors-greater [x]
	(loop [[t & rest] (map triangle (iterate inc 1))]
		(if (> (divisor-count t) x)
			t
			(recur rest))))

(println (find-triangle-divisors-greater 500))