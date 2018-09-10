require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if !root 
      self.root = BSTNode.new(value)
    else 
      insertion_helper(root, value)
    end
  end

  def find(value, tree_node = @root)
    case value <=> tree_node.value 
    when 0
      return tree_node
    when -1
      return find(value, tree_node.left) if tree_node.left
    when 1
      return find(value, tree_node.right) if tree_node.right
    end
  end

  def delete(value)
    
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return maximum tree_node.right if tree_node.right
    return tree_node.value
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private

  def insertion_helper(node, val)
    case val <=> node.value
    when -1, 0
      return insertion_helper(node.left, val) if node.left 
      node.left = BSTNode.new(val)
    when 1
      return insertion_helper(node.right, val) if node.right
      node.right = BSTNode.new(val)
    end
  end

end
