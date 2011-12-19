#!/usr/bin/env ruby
#Implemnting Robin Karp Algorithm
#Rolling Hash Functions with Rolling Stones :)
#Usefull for Plagiarism detection


def rabin_karp(source_text,search_text)

  source_text_length=source_text.length
  search_text_length=search_text.length

  radix=26 #Total number of characters
  prime=13 #A prime number of our choice to reduce the hash value calc

  #The high order digit position value we need to multiply
  highorder=(radix**(search_text_length-1))%prime

  search_text_hash=0
  source_text_hash=0

  #Preprocessing
  for c in 0...search_text_length do
    search_text_hash=(radix*search_text_hash+search_text[c].ord)%prime
    source_text_hash=(radix*source_text_hash+source_text[c].ord)%prime
  end

  for s in 0..source_text_length-search_text_length do
    
    print search_text_hash
    print " "
    puts source_text_hash

    if search_text_hash==source_text_hash
      if search_text==source_text[s...s+search_text_length]
        puts search_text+" in source at index: #{s}"
      end
    end
    
    if s<source_text_length-search_text_length
      source_text_hash=(radix*(source_text_hash-(source_text[s+1].ord)*highorder)+(source_text[s+search_text_length].ord))%prime
    end
  end

end


puts "Enter Source Text: "
source_text=gets.chomp!

puts "Enter word to search: "
search_text=gets.chomp!

robin_karp(source_text,search_text)
