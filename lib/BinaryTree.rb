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
    if node.data < value
     (node.left.nil? && node.right.nil?) ? node.delete : delete(value, node.left)
     (node.left.nil? && node.right.nil?) ? node.delete : delete(value, node.right)
    if  (node.left != nil && node.right == nil) 
      node == node.left
      node.delete
      else
        delete(value, node.left)
     (node.left == nil && node.right != nil) 
     node == node.right
     node.delete
     else
      delete(value, node.right)
     end 
     if (node.left != nil && node.right != nil) 

       

    

    end 
  end 



end

array = [1, 2, 3, 4, 5, 6, 7]
new = BinaryTree.new(array)

p new.insert(5)

new.pretty_print
