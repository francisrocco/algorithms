require "byebug"

class PolyTreeNode

  attr_accessor :value, :children
  attr_reader :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  # def parent=2(new_parent)
  #   if @parent != nil
  #     @parent.children.delete(self)
  #   end
  #     @parent = new_parent
  #     @parent.children << self unless @parent.children.include?(self)
  #
  # end

  def parent=(new_parent)
    # if @parent != nil
    #   @parent.children.delete(self)
    #   @parent = new_parent
    #   @parent.children << self unless @parent.children.include?(self)
    # end
    #   @parent = new_parent
    unless @parent.nil?
     @parent.children.delete(self)
    end
    @parent = new_parent
    unless @parent.nil?
     @parent.children << self
    end
    
  end

  def to_s
    value
  end

  def inspect
    to_s
  end

end
