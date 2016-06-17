require "byebug"

class PolyTreeNode

  attr_accessor :value, :children
  attr_reader :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    @parent.children.delete(self) unless @parent.nil?
    @parent = new_parent
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise "Incorrect" unless self.children.include?(child_node)
    child_node.parent=(nil)
  end

  def to_s
    value
  end

  def inspect
    to_s
  end

  def dfs(target_value)
    # debugger
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    return nil
  end

  def bfs(target_value)
    queue = [self.first]
    until queue.empty?
      current_node = queue.shift
      current_node == target ? return current_node : queue << self.unshift
    end
    nil
  end

end
