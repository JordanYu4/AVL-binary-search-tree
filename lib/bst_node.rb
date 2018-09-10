class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent

  def initialize(value, parent = nil)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end

  def disown(node) 
    if left == node 
      self.left = nil
    elsif right == node
      self.right = nil
    end
  end
end
