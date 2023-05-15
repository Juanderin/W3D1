class Array 

    def self.my_each(&prc) 

        i = 0 
        while i < self.length
            prc.call(self[i])
            i += 1 
        end

        return self

    end 


end 


return_value = [1, 2, 3].my_each do |num|
    puts num
   end.my_each do |num|
    puts num
   end

p return_value  # => [1, 2, 3]