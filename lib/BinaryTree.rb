require_relative 'Node'

class BinaryTree
  attr_accessor :array, :root

  def initialize(array = nil)
    @array = array.sort.uniq
    @root = build_tree(array)
  end

  def build_tree(array)

  end

  def insert; end

  def delete
    # delete leaf in the tree - previous node no longer points to it
    # case 1      node.right.nil? node.right.data = nil : delete(value, node.right)
    # case 2
    # one child node - replace it with its child (previous node points to the child)
    # node with 2 childs - next biggest - find the left most node (becomes new key) (recursively remove)
  end
end

array = [1, 2, 3, 4, 5, 6, 7]
new = BinaryTree.new(array)

p new
