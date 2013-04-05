import EulerCommon as EC

limit :: Int
limit = 10^6

is_reversible :: Int -> Bool
is_reversible x = not ((head rx_digits) == 0) && (odd $ (head x_digits) + (head rx_digits)) && all odd rx_sum_digits
		where
			x_digits = EC.digits x
			rx_digits = reverse $ EC.digits x
			rx_sum_digits = EC.digits $ x + (EC.digitsToNum $ rx_digits)

main = do
	print result
	where 
		result = length $ filter is_reversible [10..limit]


-- 6 - 18720