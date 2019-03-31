require "slugr/version"
require "string"

module Slugr

  def self.included(base)
    base.extend(ClassMethods)
  
    def set_slug
      return if (streng = self.send(self.source).to_s).blank?
      return if only_set_slug_if_empty && self.send(self.target).present?
      self.send("#{self.target.to_s}=", streng.to_s.slug)
    end
  end
  
  module ClassMethods
    def slugify source, args={}
      class_attribute :source, :target, :only_set_slug_if_empty
      self.source, self.target = source, args[:as] ||= :slug
      self.only_set_slug_if_empty = args[:when].eql?(:changed) ? false : true
      before_validation :set_slug
    end
  end

end
