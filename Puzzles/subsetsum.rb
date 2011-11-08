#!/usr/bin/env ruby
#Solving the Subset problem.
#Finding a subset of array which sums upto a particular number in an array
#For now using No Memoization (DP)
#Pointers for improvement and a brilliant post at --> http://www.skorks.com/2011/02/algorithms-a-dropbox-challenge-and-dynamic-programming/

class SubsetSum

  def initialize()    
    @list=Array.new

    puts 'Enter number of elements for an array: '
    @size=gets.to_i
    
    0.upto(@size-1) { |i| @list[i]=gets.to_i }
    
    puts 'Enter a sum '
    @sum=gets.to_i

    #Do the magic
    puts find_subset(nil,0)
  end
  
  def find_subset(currentsum,index)

    if currentsum==@sum then
      return true
    elsif index==@size
      return false
    else
      #now we have two options of either including or excluding the value at current index
      #If we exclude and the next index is something possible
      status1=find_subset(currentsum,index+1)
      #if we include
      currentsum=0 if currentsum==nil
      currentsum=currentsum+@list[index]
      status2=find_subset(currentsum,index+1)
      return status1 || status2
    end
  end
  
end

SubsetSum.new
