class PolyTreeNode

  attr_accessor :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(parent_prop)
    return nil if parent_prop.nil?
    @parent = parent_prop
    parent_prop.children << self
  end

end
