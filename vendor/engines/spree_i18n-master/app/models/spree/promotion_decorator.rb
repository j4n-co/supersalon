module Spree
  Promotion.class_eval do
    attr_accessible :translations_attributes
    translates :name, :description, :fallbacks_for_empty_translations => true
    include SpreeI18n::Translatable
  end
end
