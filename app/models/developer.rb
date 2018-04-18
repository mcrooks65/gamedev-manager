class Developer < ActiveRecord::Base
  has_many :games
  has_secure_password

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Developer.all.find{|dev| dev.slug == slug}
  end

end
