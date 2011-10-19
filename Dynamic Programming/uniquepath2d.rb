#!/usr/bin/env ruby
#Finding the number of unique path in a 2D grid where we can only more right and down
#http://tech-queries.blogspot.com/2011/01/unique-paths-in-2d-grid.html
#Personal thought at the moment--> This dosent seem to be a typical 'Optimization' problem...

require 'profile'

class Unique2D

  def initialize()
    puts "Enter rows for grid : "
    @row=gets.to_i
    puts "Enter cols for grid : "
    @col=gets.to_i
    @grid=Array.new(@row) { Array.new(@col) }

    @count=0
    uniquepath(0,0) #find the number of unique paths
    puts @count
    
    #Solving again(And this time more quickly)
    uniquepath_mem(0,0)
    puts @grid[0][0]
  end

  #Find the number of unique path 
  def uniquepath(m,n)
    
    if m==@row-1 && n==@col-1
      @count=@count+1
    else
      #Count is a sum of all possibilities arrising from travelling down or right
      uniquepath(m+1,n) if m+1<@row 
      uniquepath(m,n+1) if n+1<@col
    end
  end

  def uniquepath_mem(m,n)
    
    return 0 if m>=@row || n>=@col
    
    if (m==@row-2 && n==@col-1) || (m==@row-1 && n==@col-2)
      return 1
    else
      if @grid[m][n]==nil 
        @grid[m][n]=uniquepath_mem(m+1,n)+uniquepath_mem(m,n+1)
      else
        return @grid[m][n] 
      end
    end
  end
  
end

Unique2D.new()
