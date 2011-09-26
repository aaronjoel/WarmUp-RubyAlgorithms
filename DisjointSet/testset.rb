#!/usr/bin/env ruby

#Test cases for the Disjoint set

require './disjointset.rb'

def showtime()

  uf=UnionFind.new

  loop do
   
    puts 'Enter 1 to make a new set: '
    puts 'Enter 2 to find setname: '
    puts 'Enter 3 to union two sets: '
    puts 'Enter 4 to Exit: '

    choice=gets.to_i    
    
    case choice
    when 1
      puts 'Enter new set name '
      name=gets.chomp
      uf.make(name)
    when 2
      puts 'Enter setname to find '
      name=gets.chomp
      ans=uf.find(name)
      
      if ans.instance_of?(String) then
        puts ans
      else
        puts "Set is : #{ans[0]}"
      end
    when 3
      puts 'Enter setsname to union'
      puts 'Name 1:'
      name1=gets.chomp
      puts 'Name 2:'
      name2=gets.chomp
      uf.union(name1,name2)
    else
      break
    end

  end
  
end


showtime()
