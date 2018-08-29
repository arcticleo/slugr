class Artist < ActiveRecord::Base
  include Slugify
  slugify :name
end

class Event < ActiveRecord::Base
  include Slugify
  slugify :name, as: :some_custom_slug_field
end

class Festival < ActiveRecord::Base
  include Slugify
  slugify :name, when: :changed
end

class Screening < ActiveRecord::Base
  include Slugify
  slugify :name, as: :some_custom_slug_field, when: :changed
end

