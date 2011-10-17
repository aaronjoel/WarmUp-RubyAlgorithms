#!/usr/bin/env ruby
#Finding maximum sum of elements in an array which are non-consective in their array index
#More on the problem here --> http://tech-queries.blogspot.com/2009/05/max-possible-sum-of-non-consecutive.html
#Lets make a recursive algorithm rather than Iterative :)

#Using Profiling to see the difference between the runtime of bruteforce vs with-memoization procedure
require 'profile'

class MaxSum
  
  def initialize()
    
    @store=[6, 4, 2, 8, 1]
    puts "For Array #{@store} Answer(calc with exploring all search space): "
    
    puts max_sum(@store,@store.length-1)
   
    puts "Enter a Similar Array with values: "
    puts "Number of Elements : "
    len=gets.to_i
    
    @store2=Array.new(len)
    
    #Storage for function with memoization
    @solutions=Array.new(len)
    
    0.upto(len-1) { |i| @store2[i]=gets.to_i }
    puts max_sum_save(@store2,len-1)
     
  end
  
  #A function which explores the search space over and over again
  def max_sum(array,index)
    #Check against negative index which might creep in errors
    return 0 if index<0
    
    if index==0
      return array[index]
    else
      return max(array[index]+max_sum(array,index-2),max_sum(array,index-1))
    end
  end

  #The same function as above with memoization
  def max_sum_save(array,index)
    return 0 if index<0
    
    if index==0
      return array[index]
    elsif @solutions[index]!=nil
      return @solutions[index]
    else
      @solutions[index]=max(array[index]+max_sum_save(array,index-2),max_sum_save(array,index-1))
      return @solutions[index]
    end
  end

  def max(no1,no2)
    return no1>no2 ? no1 : no2
  end
  
end

MaxSum.new
