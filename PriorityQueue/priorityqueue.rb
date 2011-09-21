#!/usr/bin/env ruby

#A Min Heap Data Structure maintaining a Priority Queue DS :)
class PriorityQueue
  
  def initialize()
    @store=[-1] #A dummy thingy on Heap!(If we stat off our indexes with 0 things get a little messsy!  
  end
 
  private

  def leftChild(index)
    return @store[2*index]
  end
  
  def rightChild(index)
    return @store[2*index+1]
  end
  
  #Glorified heapify method which pretty much is the heart of the whole damn DS! :)
  def heapify(index)
    #Assume the left and right subroots are already valid heaps
    
    return if(leftChild(index)==nil && rightChild(index)==nil)
    
    if leftChild(index)!=nil && @store[index]<leftChild(index) then
      mini=index
    else
      mini=2*index
    end
   
    if rightChild(index)!=nil && @store[mini]>rightChild(index) then
      mini=2*index+1
    end
    
    if mini!=index then
      swap(index,mini)
      #call heapfiy recursively on minindex
      heapify(mini)   
    end
 
  end
  

  def swap(index1,index2)
    tmp=@store[index1]
    @store[index1]=@store[index2]
    @store[index2]=tmp
  end

  public
    
  #Peek the min without removing from Priority Queue
  def peekMin()
    @store[1]
  end
  
  #Return the min element from the Heap
  def getMin()
    element=@store[1]
    
    #copy last element to the first...
    @store[1]=@store[@store.length-1]
    @store.delete_at(@store.length-1) #delete the last element 

    #We need to restore the Heap Structure if altered
    heapify(1)
    return element
  end
            
  #Insert an element onto the Heap
  def insert(element)
    insertindex=@store.length
    
    @store[@store.length]=element
    return if insertindex==1 
    
    #For even inserts parent index is insertedindex/2-1 otherwise its juts insertedindex/2
    
    parentindex=insertindex/2
    
    #Incase it does not fit in(violating Heap Property)
    while insertindex!=1 && @store[parentindex] > @store[insertindex]
      swap(parentindex,insertindex)
      insertindex=parentindex
      parentindex=insertindex/2
    end
      
  end

  def showstore()
    for c in 1..@store.length-1 do
      print @store[c] 
    end
  end

end
