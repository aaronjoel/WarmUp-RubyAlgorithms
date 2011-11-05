#!/usr/bin/env ruby
#Finding all Permutations of a String

class Permuter

  def initialize(string)
    
    @stringlength=string.length
    blank=Array.new
    #The actual hard working function
    permute(blank,string)
    
  end

  def permute(blank,string)
    
    if blank.length==@stringlength
      puts blank.to_s
      return
    end
    
    if blank.length==0 then
      #just concat the first alphabet to blank String
      chartoadd=string.slice(blank.length)
      blank.push(chartoadd)
      permute(blank,string)
    else
     
      chartoadd=string.slice(blank.length)

      temparray=Array.new
      temparray=blank.clone
      
      #Add the 'char' to all possible positions in array and permute for all combinations obtained
      for c in 0..blank.length do        
        temparray.insert(c,chartoadd)
        permute(temparray,string)
        temparray=blank.clone
      end
    end
 
  end
  
end
  
Permuter.new("abc")
