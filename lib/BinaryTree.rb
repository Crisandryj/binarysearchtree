require_relative 'Node'

class BinaryTree

    attr_accessor :array, :root

    def initialize(array = nil)
        @array = array
        @root = build_tree(array)
    end 

    # def pretty_print(node = @root, prefix = '', is_left = true)
    #     pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    #     puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    #     pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    # end

    def build_tree(array)
        sorted_array = array.sort.uniq
        start = 0
        last = sorted_array.length - 1

        if start > last
            return nil
        else
            mid = sorted_array.length/2
            root = sorted_array[mid]
            node = Node.new(root)
            node.left = build_tree(sorted_array[0...mid-1])
            node.right = build_tree(sorted_array[mid+1...last])
            return root;
        end
    end 

    def insert(value)


    end 

end 


array = [1,2,3,4,5,6,7]
new = BinaryTree.new(array)
p new

