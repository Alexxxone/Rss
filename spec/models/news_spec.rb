require 'spec_helper'
describe News do


  before(:each) do
    @news = News.new(:url => "http://www.arborio.ru/feed/", :name => 'bla-bla', :published_at => "2013-11-27 06:11:48")
  end
  it "is valid with valid attributes" do
    @news.should be_valid
  end
  it "should not be valid if missing url" do
    @news.url = " "
    @news.should_not be_valid
  end
  it "should not be valid if missing name" do
    @news.name = " "
    @news.should_not be_valid
  end
  it "should not be valid if missing published_at" do
    @news.published_at = " "
    @news.should_not be_valid
  end
   it 'News types'do
     News.new.should be_a_kind_of News
   end

end