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
    target = find(value)
    children = node_children(target)
    # case children.length
    # when 0

    # when 1
    #   children[0].parent = target.parent

    # when 2
    # end
    target.parent.disown(target)
    target.parent = nil
    target.left, target.right = nil, nil
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return maximum(tree_node.right) if tree_node.right
    return tree_node
  end

  def minimum(tree_node = @root)
    return minimum(tree_node.left) if tree_node.left
    return tree_node
  end

  def depth(tree_node = @root)
    return 0 unless tree_node && tree_node.value 
    left_depth = tree_node.left ? depth(tree_node.left) + 1 : 0
    right_depth = tree_node.right ? depth(tree_node.right) + 1: 0
    return [left_depth, right_depth].max
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node == nil
    return false if (depth(tree_node.left) - depth(tree_node.right)).abs > 1
    return is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    start = minimum(tree_node)
  end


  private

  def insertion_helper(node, val)
    case val <=> node.value
    when -1, 0
      return insertion_helper(node.left, val) if node.left 
      node.left = BSTNode.new(val, node)
    when 1
      return insertion_helper(node.right, val) if node.right
      node.right = BSTNode.new(val, node)
    end
  end

  def node_children(node)
    children = []
    children << node.left if node.left 
    children << node.right if node.right 
    children
  end

end
