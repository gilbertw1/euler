(def problem-set (range 1 500))

(defn pythag-triplet [num]
		(for [x problem-set 
					y problem-set 
					z problem-set
					:let [xs (* x x) ys (* y y) zs (* z z)]
					:when (and (= (+ xs ys) zs) (= (+ x y z) num))]
			(* x y z)))

(println (first (pythag-triplet 1000)))