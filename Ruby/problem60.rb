def prime?(num)
    for i in 2..num-1
        return false if num%i==0
    end
    return true
end

def any_two_prime?(nums)
    nums.each do |x|
        (nums-[x]).each do |y|
            return false if !prime? ((x.to_s + y.to_s).to_i)
        end
    end
    return true
end

primes = (3..1000).to_a.delete_if do |x|
    !prime? x
end

inc = 0

xinc = 0
yinc = 0
zinc = 0
winc = 0

#Wishful Thinking!
primes.each do |x|
    xinc += 1
    yinc = xinc
    primes[xinc..primes.length].each do |y|
        yinc +=1
        zinc = yinc
        if any_two_prime? [x,y] then
            primes[yinc..primes.length].each do |z|
                zinc += 1
                winc = zinc
                if any_two_prime? [x,y,z] then
                    primes[zinc..primes.length].each do |w|
                        winc += 1
                        if any_two_prime? [x,y,z,w] then
                            primes[winc..primes.length].each do |v|
                                if any_two_prime? [x,y,z,w,v] then
                                    puts ((x+y+z+w+v).to_s + [x,y,z,w,v].to_s)
                                    inc += 1
                                    exit if inc == 1
                                end
                            end
                        end    
                    end
                end
            end
        end  
    end
end