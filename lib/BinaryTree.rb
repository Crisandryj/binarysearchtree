require_relative 'Node'

class BinaryTree
  attr_accessor :array, :root

  def initialize(array = nil)
    @array = array.sort.uniq
    @root = build_tree(array)
  end



  def build_tree(array)
    last = array.length - 1

    return nil if array.empty?
    
      mid = array.length / 2
      root_node = Node.new(array[mid])
      root_node.left = build_tree(array[0...mid - 1])
      root_node.right = build_tree(array[mid + 1...last])
      root_node
  end



  def insert(value, node = root)
    return nil if node.data == value
    # recursively
    # compare value to the root
    if node.data < value
      # if less than root - go to left tree else go to right tree
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    else
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
    # if value = root ...return (add nothing)
    # insert when returns nil
  end

  def delete(value, node = root)
    if node.data == value 
    node.data = nil
    else
    #delete leaf in the tree - previous node no longer points to it
    if node.data < value
      if node.left == value
         node.left == nil
      else
        delete(value,node.left)
      end
    end 
      if node.data > value
        if node.right == value
           node.right == nil
        else
          delete(value,node.right)
        end 
      end 
    #one child node - replace it with its child (previous node points to the child)
    #node with 2 childs - next biggest - find the left most node (becomes new key) (recursively remove)
  end 



end

array = [1, 2, 3, 4, 5, 6, 7]
new = BinaryTree.new(array)

p new.insert(5)

