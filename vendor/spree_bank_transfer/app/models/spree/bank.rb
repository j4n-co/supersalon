module Spree
  class Bank < ActiveRecord::Base
    #broken in rails 4
    #attr_accessible :name, :account_no, :active
    validates :name, :account_no, :presence => true
    validates_uniqueness_of :account_no , :scope => :name

    scope :active, where(:active => true)
  end
end