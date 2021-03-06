# Slugr

Slugr is a gem to automatically create ActiveRecord object slugs for use in permalinks based on a title, name, headline, or some other unique and descriptive string field. It also provides a slug convenience method to the String class.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slugr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slugr

## Usage

### Setup

Include Slugr in the model file you would would like to use it.

```ruby
include Slugr
```

### Basic usage

After you've included it, specify which attribute should trigger the slugification:

```ruby
slugify :name       # or :title, :headline, or... 
```

This will slugify the content of the source attribute `:title` and store the result in the target attribute `:slug`. 

Note that Slugr _does not_ provide migrations. It assumes that the target attribute is there, and it's your responsibility to make sure it is.

### Explicitly specify target attribute

By default, the target attribute is `:slug`. It is however possible to explicitly specify the target attribute:

```ruby
slugify :name, as: :some_custom_slug_field
```

This will instead store the slugified `:title` value to `:some_custom_slug_field`.

### Modifying Slugr behavior

By default, a slugified value is stored when the target attribute is blank. That means that it by default stores a value when an object is first created, or when the target attribute is cleared and the object is then saved:

```ruby
artist = Artist.create(name: "Ace of Base")       # slug: "ace-of-base"
artist.update(name: "ABBA")                       # slug: "ace-of-base" (still)

artist = Artist.create(name: "Ace of Base")       # slug: "ace-of-base"
artist.attributes = {name: "ABBA", slug: nil}
artist.save                                       # slug: "abba"
```

This default behavior is chosen in order to maintain permalinks and not break bookmarks. It is possible though to specify that the slug should always stay in sync with the source attribute:

```ruby
slugify :name, when: :changed
slugify :name, as: :some_name_slug, when: :changed
```

That gives this behavior: 

```ruby
artist = Artist.create(name: "Ace of Base")       # slug: "ace-of-base"
artist.update(name: "ABBA")                       # slug: "abba"
```

### Complete example

```ruby
class Event < ApplicationRecord
  include Slugr
  slugify :title, as: :permalink, when: :changed

  belongs_to :festival
  validates :permalink, uniqueness: { scope: :festival }
end
```

### Special characters

Slugr will do its best to normalize diacritics (accented characters) to its non accented ASCII equivalent:

```ruby
artist = Artist.create(name: "Mötley Crüe")       # slug: "motley-crue"
```

### String extension

Slugr extends the String class with a slug method.

```ruby
> "Côte d'Ivoire".slug
 => "cote-divoire"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arcticleo/slugr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Slugr project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/arcticleo/slugr/blob/master/CODE_OF_CONDUCT.md).
