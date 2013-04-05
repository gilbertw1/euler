require "EulerExtensions"

prime_to_find = 10001
count = 0
curr = 1

while(count < prime_to_find) do
  curr += 1
  count += 1 if curr.prime?
end

puts curr