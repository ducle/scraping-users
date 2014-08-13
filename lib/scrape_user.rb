require 'nokogiri'
require 'open-uri'

class ScrapeUser
  BASE_URL = "http://contacts-list.herokuapp.com/"
  attr_reader :user_slug

  def initialize(user_slug)
    @user_slug = user_slug
  end

  def user_url
    @user_url ||= BASE_URL + "users/" + @user_slug
  end

  def fetch_user_detail
    contacts = []
    age = nil
    name = nil
    begin
      doc = Nokogiri::HTML(open(self.user_url))
      age  = doc.at_css("#age").try(:text)
      name = doc.at_css("h1").try(:text)
      doc.css("#friends-list li").each do |li|
        contacts << li.text
      end
    rescue OpenURI::HTTPError => e
      puts e.message
    end
    {contacts: contacts, age: age, name: name, slug: @user_slug}
  end

end
