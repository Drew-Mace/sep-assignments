require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    pointer = root
    if node.rating > pointer.rating
      if pointer.right.nil?
        pointer.right = node
        pointer.right.parent = pointer
      else
        insert(pointer.right, node)
      end
    elsif node.rating < pointer.rating
      if pointer.left.nil?
        pointer.left = node
        pointer.left.parent = pointer
      else
        insert(pointer.left, node)
      end
    else
      return nil
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil?
      return nil
    elsif root.title == data
      return root
    else
      if find(root.right, data) != nil
        return find(root.right, data)
      else
        return find(root.left, data)
      end
    end
  end

  def delete(root, data)
    find = find(root, data)
    return nil if find == nil
    
    unless find.left != nil && find.right != nil
      if find.left.nil?
        if find.parent.left == find
          find.parent.left = find.right
        else
          find.parent.right = find.right
        end
        find.parent.right = find.right
      elsif find.right.nil?
        if find.parent.left == find
          find.parent.left = find.left
        else
          find.parent.right = find.left
        end
        find.left.parent = find.parent
      else 
        targetNode = find.left
        
        until targetNode.right.nil?
          targetNode = targetNode.right
        end
        targetNode.parent.left = targetNode.left
        targetNode.left = find.left
        targetNode.right = find.right
        targetNode.parent = find.parent
        look.left.parent = targetNode if !find.left.nil?
        look.right.parent = targetNode if !find.right.nil?
        
        if find.parent.left == find
          find.parent.left = targetNode
        else
          find.parent.right = targetNode
        end
      end
    end
    if find.parent.left = find
      find.parent.left = nil
    else
      find.parent.right = nil
    end
    find = nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if children == nil
      children = [@root]
    end
    nRow = []
    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      nRow.push(child.left) if child.left != nil
      nRow.push(child.right) if child.right != nil
    end
    if nRow.size == 0
      return nil
    else
      printf(nRow)
    end
  end
end
