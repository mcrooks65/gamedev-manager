class Game < ActiveRecord::Base
  belongs_to :developer

  def slug
    title.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Game.all.find{|game| game.slug == slug}
  end
end
