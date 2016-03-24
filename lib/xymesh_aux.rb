module XYMesh

  # LNode is a container class, which participates in the LList class.
  class LNode 
    attr_accessor :nxt, :prev, :value, :llist

    # Initialize LNode object
    # @param value [Object] arbitrary payload
    # @param nxt [LNode] link to next LNode object
    # @param prev [LNode] link to previous LNode object
    def initialize(value=nil, nxt=nil, prev=nil)
      @nxt = nxt
      @prev = prev
      @value = value

      @llist = nil
    end

    # Append new payload or existing LNode to this LNode
    #
    # @param node [Object] if node is not instance of LNode than LNode is created with this payload
    def append(node)
      if node.instance_of? LNode
        nnode = node
      else
        nnode = LNode.new(node)
      end
      @nxt = nnode
      nnode.prev = self
      nnode.llist = @llist
      nnode
    end

    # Remove this LNode from connected chain of LNodes
    def unlink()
      @prev.nxt = @nxt

      @nxt.prev = @prev unless @nxt.nil?
      @llist.size = @llist.size - 1 unless @llist.nil?
    end

    def to_s
      "#{@value.to_s}"
    end
  end # end class LNode

  # Class that defines linked list
  class LList
    include Enumerable
    
    attr_accessor :size

    def initialize() 
      @anchor = LNode.new
      @anchor.llist = self
      @tail = @anchor
      @size = 0
    end

    # Append payload or LNode
    def append(node) 
      @size = @size + 1
      @tail = @tail.append(node)
      @tail
    end

    alias_method :<<, :append

    # Get last LNode in the list
    def last
      @tail
    end

    # Get n'th element in the list. Note that elements are indexed starting from 1, not 0
    def [](n)
      #print "n->#{n}\n"
      idx = 1
      node = @anchor.nxt
      while !node.nil? && idx < n
        node = node.nxt
        idx = idx + 1
      end
      node
    end

    # Iterate over pair of variables, index of LNode and LNode itself.
    def each(&block)
      idx = 1
      nxt=@anchor.nxt
      while !nxt.nil?
        _nxt = nxt.nxt
        yield idx, nxt
        nxt = _nxt
        idx += 1
      end    
    end
    
    def to_s
      nxt=@anchor.nxt
      retval = "["
      while !nxt.nil?
        retval = retval + nxt.to_s
        nxt = nxt.nxt
        retval += "," if !nxt.nil? 
      end
      retval += "]"
      retval
    end

    # Is it empty
    def empty?
      @anchor.nxt.nil?
    end
  end # end of class LList

end
