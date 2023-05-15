class Array 

    def my_each(&prc) 

        i = 0 
        while i < self.length
            prc.call(self[i])
            i += 1 
        end

        return self

    end 

    def my_select(&prc)
        new_array = []

        i = 0 
        while i < self.length 
           if prc.call(self[i])
            new_array << self[i] 
           end   
           i += 1
        end
        new_array
    end
    

    def my_reject(&prc) 

        new_arr = []

        i = 0
        while i < self.length 
            if !prc.call(self[i])
                new_arr << self[i]
            end 
            i += 1
        end 

        new_arr

    end 




end 


# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end

# p return_value  # => [1, 2, 3]


# p a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]