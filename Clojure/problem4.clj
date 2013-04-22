(def problem-set (range 100 1000))

(defn reverse-num [num]
	(loop [x num rev 0]
		(if (= x 0)
			rev
			(recur (quot x 10) (+ (rem x 10) (* rev 10))))))

(defn pal? [x]
	(= x (reverse-num x)))

(defn largest-palindrome []
	(apply max
		(for [x problem-set 
					y problem-set
					:let [z (* x y)]
					:when (pal? z)]
			z)))

(println (largest-palindrome))