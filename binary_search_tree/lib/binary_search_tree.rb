require 'pry'

class Bst

  def initialize(initial_data)
    @head = Node.new(initial_data)
  end

  def data
    @head.data
  end

  def insert(new_data)
    insert_node(new_data, @head)
  end

  def insert_node(new_data, node)
    if new_data <= node.data
      node.left.nil? ? node.left = Node.new(new_data) : insert_node(new_data, node.left)
    else
      node.right.nil? ? node.right = Node.new(new_data) : insert_node(new_data, node.right)
    end
  end

  def left
    @head.left
  end

  def right
    @head.right
  end

  def each(&block)
    [4].each(&block)
  end

end

class Node

  attr_accessor :data, :left, :right

  def initialize(data, left=nil, right=nil)
    @data = data
    @left = left
    @right = right
  end

end
