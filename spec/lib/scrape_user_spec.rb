require 'rails_helper'
require 'scrape_user'

RSpec.describe ScrapeUser do

  it "should initialize successfully with slug" do
    slug = "mr-elvis-dietrich"
    scrape = ScrapeUser.new(slug)
    expect(scrape.user_slug) == "jana-lockman"
    expect(scrape.user_url)  ==  ScrapeUser::BASE_URL + "users/" + slug
  end

  it "should fetch all contacts" do
    slug = "mr-elvis-dietrich"
    scrape = ScrapeUser.new(slug)
    user = scrape.fetch_user_detail
    expect(user[:contacts]) == ['carlee-parker-jr', 'carlee-parker-jr', 'carlee-parker-jr', 'lilly-runolfsdottir']
    expect(user[:age]) == 61
    expect(user[:name]) == 'Mr. Elvis Dietrich'
    expect(user[:slug]) == slug
  end
end
