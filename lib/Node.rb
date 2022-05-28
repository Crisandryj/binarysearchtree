class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left_chidren = nil, right_children = nil)
    @data = data
    @left = left_chidren
    @right = right_children
  end
end
