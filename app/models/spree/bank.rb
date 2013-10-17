module Spree
  class Bank < ActiveRecord::Base
    attr_accessible :name, :account_no, :active, :address, :person_name, :currency
    validates :name, :account_no, :presence => true
    validates_uniqueness_of :account_no , :scope => :name

    scope :active, where(:active => true)
  end
end