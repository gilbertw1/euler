(use 'clojure.java.io)

(defn convert-row [row]
	(->> 
		row
		(#(clojure.string/split % #"\s"))
		(map #(Integer/parseInt %))))

(defn read-triangle []
	(with-open [rdr (reader "problem67.txt")]
		(vec (map convert-row (line-seq rdr)))))

(defn calc-path [prev curr]
	(loop [[pfst psnd & prest] prev [cfst & crest] curr res []]
		(if (nil? cfst) 
			res
			(recur (cons psnd prest) crest (conj res 	(+ cfst (max pfst (if (nil? psnd) 0 psnd))))))))

(defn largest-path [triangle]
	(loop [[fst & rest] triangle acc nil]
		(cond 
			(nil? fst) (apply max acc)
			(nil? acc) (recur rest fst)
			:else (recur rest (calc-path acc fst)))))

(println (largest-path (reverse (read-triangle))))