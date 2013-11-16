require 'open-uri'
require 'feedzirra'
class News < ActiveRecord::Base
  attr_accessible :url, :name, :summary, :content, :published_at, :guid

  def self.update_from_feed(url)

    if url=~ /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
      feed = Feedzirra::Feed.fetch_and_parse(url)
      feed.entries.each do |e|
        #"Looking at the entry #{e.title.gsub("n",' ')}".printn
        #link = (Nokogiri(e.summary)/"img").to_html
        #next if link.empty?
        #link = link[/"(.*)"/].gsub(/["]/,'')
        #filename = link.split('/').last
        unless exists? :guid => e.id
          create!(
              :name         => e.title,
              :summary      => e.summary,
              :content      => e.content,
              :published_at => e.published,
              :guid         => e.id
          )
        end
      end


    end
  end
end
