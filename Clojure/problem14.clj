;; Not as efficient as I'd have hoped 
(declare memo-chain-length)

(defn chain-length [x]
	(cond
		(= x 1) 1
		(even? x) (inc (memo-chain-length (/ x 2)))
		:else (inc (memo-chain-length (inc (* 3 x))))))

(def memo-chain-length (memoize chain-length))
;; End Inefficiency


(defn chain-length-tailrec [x]
	(loop [curr x len 1]
		(cond
			(= curr 1) len
			(even? curr) (recur (/ curr 2) (inc len))
			:else (recur (inc (* 3 curr)) (inc len)))))

(defn longest-chain-below [x]
	(loop [curr x clen 0 cval 0]
		(if (= curr 1)
			cval
			(let [nlen (chain-length-tailrec curr)]
				(if (> nlen clen)
					(recur (dec curr) nlen curr)
					(recur (dec curr) clen cval))))))

(println (longest-chain-below 1000000))