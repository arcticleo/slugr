ActiveRecord::Schema.define do
  self.verbose = false

  create_table :artists, :force => true do |t|
    t.string :name
    t.string :slug
    t.string :some_custom_slug_field
  end

  create_table :events, :force => true do |t|
    t.string :name
    t.string :slug
    t.string :some_custom_slug_field
  end

  create_table :festivals, :force => true do |t|
    t.string :name
    t.string :slug
    t.string :some_custom_slug_field
  end

  create_table :screenings, :force => true do |t|
    t.string :name
    t.string :slug
    t.string :some_custom_slug_field
  end

end
