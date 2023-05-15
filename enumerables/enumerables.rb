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

    def my_any?(&prc)

        my_each do |ele|
            if prc.call(ele)
                return true 
            end
        end
        return false 
    end

    def my_all?(&prc)
        my_each do |ele|
            if !prc.call(ele)
                return false
            end
        end
        return true 
    end

    def my_flatten

        return [self] if self.class != Array

        flatten = []

        my_each do |ele|
            if ele.class == Array
                flatten += my_flatten
            else 
                flatten << ele 
            end 
        end 
        flatten
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


# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten