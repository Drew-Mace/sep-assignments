require_relative 'node'

class BinaryHeap
  
  def initialize(root)
    @root = root
  end
  
  def insert(root, node)
   pointer = root
    if node.rating > pointer.rating
      if pointer.left.nil?
        pointer = pointer.left
        node = pointer
      elsif node.rating < pointer.rating 
        node = pointer.left
      end
      elsif node.rating > pointer.rating 
        if pointer.right.nil? 
          pointer = pointer.right
          node = pointer
        elsif node.rating < pointer.rating
          node = pointer.right
        end
    end
  end
  
  def order(node)
    if node != root
      if node.rating < node.parent.rating
        guardian = node.parent.parent if node.parent.parent != nil
        parent = node.parent
        left = node.left
        right = node.right
        
        if parent.left == node
          ele = node.parent.right
        else 
          ele = node.parent.left
        end
        if ele != nil
          if parent.left == node
            node.right = ele
          else 
            node.left = ele
          end
          
          ele.parent = node
        end
        
        if parent.left == node
          node.left = parent
        else
          node.right = parent
        end
        
        parent.parent = node
        left.parent = parent if left != nil
        r.parent = parent if right != nil
        parent.left = 1
        parent.right = right
        
        if guardian != nil && guardian.left == parent
          guardian.left = node
        end
        
        if guardian != nil && guardian.right == parent
          guardian.right = node
        end
        if guardian.nil? 
          @root = node
        end
        node.parent = guardian
        order(node)
      end
    end
  end
  
  def find(node, target)
    if node.nil? 
      return nil
    elsif node.title == target
      return node
    else
      x = find(node.right, target)
      y = find(node.left, target)
      if x != nil
        return x
      elsif y !=nil
        return y
      else 
        return nil
      end
    end
  end
  
  def delete(root, data)
    found = find(root, data)
    return nil if found == nil
    replacement = grab_last()
    if replacement != found
      if replacement.parent.right == replacement
        replacement.parent.right = nil
      end
      if replacement.parent.left == replacement
        replacement.parent.left = nil
      end
      replacement.left = found.left
      replacement.right = found.right
      found.left.parent = replacement if !found.left.nil?
      found.right.parent = replacement if !found.right.nil?
      order(replacement)
      if (!replacement.left.nil? && replacement.rating > replacement.left.rating) || (!replacement.right.nil? && replacement.rating > replacement.right.rating)
        lower(replacement)
      end
    else
      if found.parent.left == found
        found.parent.left = nil
      else
        found.parent.right = nil
      end
      found = nil
    end
  end
  
  def lower(node)
    unless node.left.nil?
      if node.right.nil? || node.left.rating < node.right.rating
        swap = node.left
        swap.left.parent = node if !swap.left.nil?
        node.left = swap.left
        swap.left = node
        swap.right.parent = node if !swap.right.nil?
        temp = node.right
        node.right = swap.right
        swap.right = temp
        temp.parent = swap
      else 
        swap = node.right
        temp = node.left
        swap.left.parent = node
        swap.right.parent = node
        node.right = swap.right
        node.left.parent = swap
        node.left = swap.left
        swap.left = temp
        swap.right = node
      end
      
      unless node.parent.nil? 
        if node.parent.left == node
          node.parent.left = swa
        end
      else 
        @root = swap
      end
      swap.parent = node.parent
      node.parent = swap
      
      if (!node.left.nil? && node.rating > node.left.rating) || (!node.right.nil? && node.rating > node.right.rating)
        lower(node)
      end
    end
  end
  
  def grab_last(children=nil)
    if children.nil?
      children = [@root]
    end
    newEl = []
    children.each do |child|
      newEl.push(child.left) if child.left != nil
      newEl.push(child.right) if child.right != nil
    end
    if newEl.size == 0
      return children[-1]
    else
      grab_last(newEl)
    end
  end
  
  def printf(children=nil)
    if children.nil?
      if @root
        children = [@root]
      else 
        return nil
      end
    end
    newEl = []
    children.each do |child|
      puts "#{child.title} rating: #{child.rating}"
      newEl.push(child.left) if child.left != nil
      newEl.push(child.right) if child.right != nil
    end
    if newEl.size == 0
      return nil
    else
      printf(newEl)
    end
  end
end
  