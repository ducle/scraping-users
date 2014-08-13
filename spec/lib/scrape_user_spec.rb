require 'rails_helper'
require 'scrape_user'

RSpec.describe ScrapeUser do

  it "should initialize successfully with slug" do
    scrape = ScrapeUser.new("jana-lockman")
    expect(scrape.user_slug) == "jana-lockman"
    expect(scrape.user_url)  ==  ScrapeUser::BASE_URL + "users/" + "jana-lockman"
  end

  it "should fetch all contacts" do
    scrape = ScrapeUser.new("jana-lockman")
    user = scrape.fetch_user_detail
    expect(user[:contacts]) == ['lavinia-mayert', 'mr-kathryn-oberbrunner']
  end
end
