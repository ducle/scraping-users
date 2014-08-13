class User < ActiveRecord::Base
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  def self.enqueue_users(usernames)
    usernames.each do |name|
      UserWorker.perform_async(name)
    end
  end

  # create user after scraping user detail
  def self.create_user(user={})
    if user[:name] && !User.exists?(slug: user[:slug])
      self.create(name: user[:name], age: user[:age], slug: user[:slug])
      user[:contacts].each do |contact|
        UserWorker.perform_async(contact)
      end
    end
  end

end
