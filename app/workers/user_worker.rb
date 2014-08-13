require 'scrape_user'

class UserWorker
  include Sidekiq::Worker

  def perform(name)
    scrape = ScrapeUser.new(name)
    user = scrape.fetch_user_detail
    User.create_user(user)
  end

end
