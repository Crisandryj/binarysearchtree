require_relative 'Node'

class BinaryTree

    def initialize(array = nil, root = nil)
        @array = array
        @root = root
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

end 

new = BinaryTree.new()
array = [1,2,3,4,5,6,7]

p new.build_tree(array)

