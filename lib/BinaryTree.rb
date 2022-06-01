require_relative 'Node'

class BinaryTree
  attr_accessor :array, :root

  def initialize(array = nil)
    @array = array.sort.uniq
    @root = build_tree(array)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def build_tree(array)
    return nil if array.empty?

    mid = (array.length - 1)/2
    root_node = Node.new(array[mid])

    root_node.left = build_tree(array[0...mid])
    root_node.right = build_tree(array[(mid + 1)..-1])

    root_node
  end

  def insert(value, root = nil)
    root = value if root.nil?

    root.left.nil? ? root.left = value : insert(value, root.left)
    root.right.nil? ? root.right = value : insert(value, root.right)
  
  end

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

new.insert(0)
new.pretty_print
