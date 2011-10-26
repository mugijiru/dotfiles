require 'pp'
require 'rubygems'

require 'hirb'
Hirb.enable

class Object
  def grep_methods(str)
    self.methods.grep(/#{str}/).sort
  end
  alias :g :grep_methods
end

#require 'wirble'
#Wirble.init
#Wirble.colorize
