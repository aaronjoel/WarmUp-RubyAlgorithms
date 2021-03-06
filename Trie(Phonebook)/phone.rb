#INCOMPLETE TRIE DEFINITION :|
#!/usr/bin/env ruby

require './phonebook.rb'

class Phone
  
  #Import contacts from a store file 'data' and build up the Trie
  def initialize()
    datafile=File.new('data','r')
    
    #Phone 'HAS-A' phonebook analogy!
    @phonestore=Phonebook.new

    loop do

      #Read the contacts seperated by a $ (Each contact is  a 'name','phonenumber' and a 'tweetid'
      name=datafile.gets
      
      continue if name=='$'  #This is just a seperator
 
      break if name==nil    #Termination for the Loop
      
      number=datafile.gets.to_i
      
      twitter=datafile.gets
      
      contact=Contact.new(name,number,twitter)
      @phonestore.add(contact)      
      
    end
  end

  #Boot your phone to get your
  def boot() 
    
    loop do
      
      puts "Enter 1 for Searching a Contact: "
      puts "Enter 2 for Adding a Contact: "
      puts "Enter 3 to Delete: "
      puts "Enter AnythingElse to Exit: "

      ans=gets.to_i

      if ans==1 then
        puts 'Enter name to search: '
        nametosearch=gets
        #For now use the search function withoutn suggestion
        value=@phonestore.search(@phonestore.rootnode,nametosearch,0)
        if value.instance_of?(Array) then
          puts 'Element not found'
        elsif
          puts "Name: #{value.name}"
          puts "Number: #{value.number}"
          puts "Twitter: #{value.twitter}"
        end
      elsif ans==2 then
        puts "Enter Contact Name: "
        contactname=gets
        puts "Enter phonenumber: "
        phonenumber=gets.to_i
        puts "Enter twitterid: "
        twitterid=gets
        @phonestore.add(Contact.new(contactname,phonenumber,twitterid))
      elsif ans==3 then
        nametodelete=gets
        @phonestore.delete(nametodelete)
      else
        break  #Everything else if exit
      end
    end

  end
end
  
myphone=Phone.new
myphone.boot
