Feedzirra::Feed.add_common_feed_entry_element('media:thumbnail', :value => :url, :as => :image)
Feedzirra::Feed.add_common_feed_entry_element("enclosure", :as => :image, :value => :url, :with => {:type => "image/jpg"})
Feedzirra::Feed.add_common_feed_entry_element("atom:link", :as => :url, :value => :href)
