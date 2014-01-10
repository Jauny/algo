# Implementation of a Binary Tree
# .. in progress ..

class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(value=nil, left=nil, right=nil, parent=nil)
    @value, @left, @right, @parent = value, left, right, parent
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize(root=Node.new)
    @root = root
  end

  def add_node(node, start=root)
    if node.value < start.value
      if start.left
        add_node(node, start.left)
      else
        start.left = node
        node.parent = start.left
      end
    elsif node.value > start.value
      if start.right
        add_node(node, start.right)
      else
        start.right = node
        node.parent = start.right
      end
    end
  end

  def search_value(value, start=root)
    if start.nil? || value == start.value
      start
    elsif value < start.value
      search_value(value, start.left)
    elsif value > start.value
      search_value(value, start.right)
    end
  end

  def search_node(node, start=root)
    if start.nil? || node == start
      return start
    elsif node.value < start.value
      search_node node, start.left
    elsif node.value > start.value
      search_node node, start.right
    end
  end

  def minimum(start=root)
    return start if !start.left
    minimum(start.left)
  end

  def maximum(start=root)
    return start if !start.right
    maximum(start.right)
  end

  def successor(node)
    if node.right
      minimum(node.right)
    else
      y = node.parent
      while y && node == y.right
        node = y
        y = y.parent
      end
      y
    end
  end
end

# tests
root = Node.new 5
nodes = [Node.new(4), Node.new(2), Node.new(3)]
tree = BinarySearchTree.new root
nodes.each {|n| tree.add_node n}
