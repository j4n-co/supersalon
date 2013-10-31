module Spree
  Taxon.class_eval do
    attr_accessible :translations_attributes
    translates :name, :description, :meta_title, :meta_description, :meta_keywords,
      :permalink, :fallbacks_for_empty_translations => true
    include SpreeI18n::Translatable
  end
end
