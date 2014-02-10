module Spree
  Classification.class_eval do
    #breaks rails 4
    #attr_accessible :position
  end
end