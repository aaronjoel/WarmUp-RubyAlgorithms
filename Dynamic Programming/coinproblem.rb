#!/usr/bin/env ruby
#Solving coin problem with Dynammic programing
#Minimum number of Coins --> http://tech-queries.blogspot.com/2009/04/minimum-number-of-coins.html
#Lets do away with Classes for a while :)


def mincoins()
  coins=[1,5,10,30,40]
  
  puts "Coin availaible are: #{coins} "

  puts "Enter an amount: "
  amount=gets.to_i

  #Initialize solution array
  store= Array.new(amount+1)
  store[0]=0 #For amount 0 we need 0 coins :P
  store.fill(1,store.length-1) { |i| store[i]=1.0/0 } # Awesomeness of Ruby --> INFINITY! 
  
  #Iterative build solution for all amount
  for c in 1..amount do
    c1=0 #coin index
    #Till the time coins are smaller than amount value
    while c1<coins.length && coins[c1]<=amount  do
      if 1+store[c-coins[c1]] < store[c] then
        store[c]=1+store[c-coins[c1]]
      end
      c1=c1+1
    end
  end
  
  puts "Coins needed: #{store[amount]} "

end

mincoins()
