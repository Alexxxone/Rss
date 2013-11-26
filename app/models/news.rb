require 'open-uri'
require 'feedzirra'
class News < ActiveRecord::Base
  attr_accessible :url, :name, :content, :published_at, :summary, :guid, :thumbnail, :image_url


  def self.update_from_feed(url)
    if url=~ /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
      feed = Feedzirra::Feed.fetch_and_parse(url).entries[0...9].each do |e|
        unless exists? :guid => e.id
          create!(
              :name => e.title,
              :url => e.url,
              :content => e.content,
              :published_at => e.published,
              :guid => e.id,
              :thumbnail => e.image,
              :image_url => e.image
          )
        end
      end
    end
  end
end
