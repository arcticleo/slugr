require "spec_helper"

RSpec.describe Slugify do

  it "has a version number" do
    expect(Slugify::VERSION).not_to be nil
  end

  it "Returns an instance of Artist" do
    expect(Artist.new).to be_a(Artist)
  end

  it "Returns a saved instance of Artist" do
    expect(Artist.create(name: "Ace of Base").id).to be_a(Integer)
  end
  
  it "Stores slug in :slug by default" do
    expect(Artist.create(name: "Ace of Base").slug).to eq("ace-of-base")
  end

  it ":some_custom_slug_field should be nil by default" do
    expect(Artist.create(name: "Ace of Base").some_custom_slug_field).to eq(nil)
  end

  it ":slug should remain the same on update by default" do
    artist = Artist.create(name: "Ace of Base")
    artist.update(name: "ABBA")
    expect(artist.slug).to eq("ace-of-base")
  end

  it ":slug diacritics should be normalized to non accented ASCII equivalent" do
    expect(Artist.create(name: "Mötley Crüe").slug).to eq("motley-crue")
  end

  it "Returns an instance of Event" do
    expect(Event.new).to be_a(Event)
  end

  it "Returns a saved instance of Event" do
    expect(Event.create(name: "Ace of Base").id).to be_a(Integer)
  end

  it "Event stores slug in :some_custom_slug_field" do
    expect(Event.create(name: "Ace of Base").some_custom_slug_field).to eq("ace-of-base")
  end

  it "Event :slug should be nil" do
    expect(Event.create(name: "Ace of Base").slug).to eq(nil)
  end

  it ":some_custom_slug_field should remain the same" do
    event = Event.create(name: "Ace of Base")
    event.update(name: "ABBA")
    expect(event.some_custom_slug_field).to eq("ace-of-base")
  end

  it "Returns an instance of Festival" do
    expect(Festival.new).to be_a(Festival)
  end

  it "Returns a saved instance of Festival" do
    expect(Festival.create(name: "Popaganda").id).to be_a(Integer)
  end

  it ":slug should stay in sync with update" do
    festival = Festival.create(name: "Ace of Base")
    festival.update(name: "ABBA")
    expect(festival.slug).to eq("abba")
  end

  it "Returns an instance of Screening" do
    expect(Screening.new).to be_a(Screening)
  end

  it "Returns a saved instance of Screening" do
    expect(Screening.create(name: "Ace of Base").id).to be_a(Integer)
  end

  it ":some_custom_slug_field should stay in sync with update" do
    screening = Screening.create(name: "Ace of Base")
    screening.update(name: "ABBA")
    expect(screening.some_custom_slug_field).to eq("abba")
  end

end


#it "Realogy::Listing without entity_id is invalid" do
#  expect(Realogy::Listing.new(last_update_on: DateTime.now).valid?).to be_falsey
#end

#it "Realogy::Listing without last_update_on is invalid" do
#  expect(Realogy::Listing.new(entity_id: "0123456789").valid?).to be_falsey
#end

#it "Realogy::Listing with both entity_id and last_update_on is valid" do
#  expect(Realogy::Listing.new(entity_id: "0123456789", last_update_on: DateTime.now).valid?).to be_truthy
#end
