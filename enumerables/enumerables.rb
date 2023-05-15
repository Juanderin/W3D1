require "byebug"
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

        flatten = []

        my_each do |ele|
            if ele.class == Array
                flatten += ele.my_flatten
            else 
                flatten << ele 
            end 
        end 
        flatten
    end

    # def my_zip(*args)
    #     new_arr =[]
    #     i = 0 
    #     while i < self.length
    #         args.my_each do |arrays|
    #             arrays.my_each do |ele|
    #                 j = 0 
    #                 while j < arrays.length 
    #                 new_arr += [self[i],*arrays[j]]
    #                 j += 1
    #                 end   
    #             end
    #         end 
    #         i += 1 
    #     end
    #     new_arr
    # end

    def my_zip(*args)
        # debugger
        
        new_arr = Array.new(self.length){Array.new(self.length)}
        
        arr_holder = []
        arr_holder << self
        
        args.my_each do |array|
            arr_holder << array
        end
            (0...self.length).each do |row|
                (0...self.length).each do |col|
                    new_arr[col][row] = arr_holder[row][col]
                end
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


# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false

# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]