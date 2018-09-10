class BSTNode
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value, parent = nil)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end

  def disown(node) 
    if left == node 
      left = nil
    elsif right == node
      right = nil
    end
  end
end
