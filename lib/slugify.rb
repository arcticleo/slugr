require "slugify/version"

module Slugify

  def self.included(base)
    base.extend(ClassMethods)
  
    def slug_for_string streng
      return streng.gsub(/('|’)/, '').mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').parameterize.to_s
    end
  
    def set_slug
      return if (streng = self.send(self.source).to_s).blank?
      return if only_set_slug_if_empty && self.send(self.target).present?
      self.send("#{self.target.to_s}=", slug_for_string(streng))
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
