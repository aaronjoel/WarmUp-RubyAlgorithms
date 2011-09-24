#A quick phone book implementation in Ruby with Trie DS
#Nothing fancy,no compression,space efficiency is kinda screwed up! :|
#What If two people with same name have to stored? ---> You just give them different names :P

#Optional--->Maybe also suggest possible contact name suggestion for mis-spelt contacts(Another thing Trie is good with)

Contact=Struct.new('Contact',:name,:number,:twitter)

Node=Struct.new('Node',:label,:contact,:link)

class Phonebook
  
  attr_accessor :rootnode
  
  def initialize()
    @rootnode=Node.new(nil,nil,Array.new(127)) #The root node is all nill, with an Array
  end

  def add(contact)
    #A little bit of duck typing :)
    #raise 'InvalidType For Contact!' unless contact.instanceof?(Contact)
    
    #Search for the last node we could get up to
    last=search(@rootnode,contact.name,0)
    
    unless last.instance_of?(Array) then  #A contact already exists with the name
      puts 'A contact with the same name already exists!'
      return
    end
    
    lastnode=Node.new
    
    if last.instance_of?(Array) then
      indextostore=last[1]
      lastnode=last[0]  #lastnode now points to the node returned
    end
    
    #We know the nodes which already exist in the Trie and what we are supposed to add next
    for x in indextostore...contact.name.length do
      newnode=Node.new(contact.name[x],contact,Array.new(127))  #make me a new node
      asciicode=contact.name[x].ord #The new label for the node
      lastnode.link[asciicode]=newnode
      lastnode=newnode   #we have a new lastnode
    end
  end

  #A Trie searching method returns the refrence to the node which has a refrence to our contact instance.
  #In case the name isnt found in the Trie,we return refrence to the last node in the path which tracks to the name. (Hope I make sense)
  def search(node,contactname,index)    
    #Break the Contact char by char and have the contact stored at the last node
    charsplit=contactname.split(//)
    asciicode=charsplit[index].ord   #Gets the ASCII code for the character
    
    if node.link[asciicode]==nil then
      return Array[node,index]  # An array with node and the index upto which we have traver
    elsif node.link[asciicode]!=nil && index==contactname.name.length-1 #we have come all the way to last char or we couldnt find it. We get the last node anyways
      return node
    else
      #Recursively call search
      search(node.link[asciicode],contactname,index=index+1)
    end
  end
 
  #TODO: Implement the delete function
  def delete(contactname)

  end
  
  #TODO: Implement the Suggestion function-Find the contact or show a Did you mean?
  def findorsuggest()
    
  end

end
  
