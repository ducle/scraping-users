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
    doc = Nokogiri::HTML(open(self.user_url))
    age = doc.at_css("#age").try(:text)
    doc.css("#friends-list li").each do |li|
      contacts << li.text
    end
    {contacts: contacts, age: age}
  end

end
