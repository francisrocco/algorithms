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
    return self if self.value == target_value
    return nil if self.children.empty?
    children.each do |child|
      dfs(child)
      return child.value if child.value == target_value
    end
    return nil
  end

end
