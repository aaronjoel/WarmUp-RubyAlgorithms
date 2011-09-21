#!/usr/bin/env ruby

#Testing the Priority Queue

require './priorityqueue.rb'

def vanilatest()
  
  pq=PriorityQueue.new
  #Good old menu driven Tester :)
  
  puts "Opertions for PriorityQueue"
  
  loop do
    puts "Enter 1 to Insert: "
    puts "Enter 2 to DeleteMin: "
    puts "Enter 3 to PeekMin: "
    puts "Enter 4 to show store: "
    puts "Enter 5 to Quit: "
    input=gets.to_i

    if input==1 then
      item=gets.to_i
      pq.insert(item)
    elsif input==2 then
      puts pq.getMin()
    elsif input==3 then
      puts pq.peekMin()
    elsif input==4 then
      pq.showstore()
    else
      break
      
    end 
    
  end
  
end

vanilatest()

