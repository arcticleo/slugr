String.class_eval do
  
  def slug
    self.gsub(/('|’|\.)/, '').unicode_normalize(:nfkd).gsub(/[^\x00-\x7F]/n,'').parameterize
  end
  
end
