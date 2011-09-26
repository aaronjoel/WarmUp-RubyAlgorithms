#!/usr/bin/env ruby
#A disjoint set implementation in ruby with Hash
#Working on two Heuristics for better performance --> UnionbyRank and Path Compression

#Any item we push in our set 
#Item is a single key-value pair(Hash with one item)
#Value is name of its parent or the size of root

class UnionFind
  
  attr_accessor :store 
  
  def initialize()
    @store=Hash.new
  end

  private 
  
  #Return the name of set to which this item belongs
  #Original name for which we are checking the answer for
  #checkitem name for which we check during recursive calls
  #Initially originalname and checkitem are same
  def findSet(originalname,checkitem) 
    if @store[checkitem].is_a?(Integer) then
      #Updating refrence to speed up further query
      if originalname!=checkitem then
        @store[originalname]=checkitem
      end
      return Array.[](checkitem,@store[checkitem])  #Return the Absolute Parent name and the number of element it has
    else
      findSet(originalname,@store[checkitem]) 
    end
  end
  
  #The pretty looking public facing function
  public 
  
  def find(itemname)
    if @store.has_key?(itemname) then
      return findSet(itemname,itemname)
    else
      return "No Such Item exists in Set!"
    end
  end

  #Make a new set with one element 
  def make(itemname)
    @store[itemname]=1
    puts 'yes' if @store[itemname].instance_of?(Integer)
  end

  #Param1--> The 'bigitem', the set which is taking over
  #Param2--> The 'smallitem', the set which gets taken over
  def union(setone,settwo)   
    #Find the number of elements , make root of the Tree with fewer nodes point to root of the tree with large node
    first=find(setone)
    second=find(settwo)

    if first.instance_of?(String) || second.instance_of?(String) then
      puts 'One of the Input is not a valid set'
      return
    end
    
    if first[1]>=second[1] then
      @store[settwo]=setone  #settwo has more elements
      @store[first[0]]=second[1]+first[1]
    else
      @store[setone]=settwo
      @store[first[0]]=first[1]+second[1]
    end
  end

end
