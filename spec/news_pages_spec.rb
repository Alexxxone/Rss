require 'spec_helper'
describe "News pages" do
  subject {page}
  describe "/newses/new" do
  describe 'with valid information' do
  it 'visit newses/new' do
     visit "/newses/new"
     fill_in "news_url", :with=> "http://www.arborio.ru/feed/"
     click_button "ok"
    end

  end
  describe 'with invalid information' do
    it 'visit newses/new' do
      visit "/newses/new"
      fill_in "news_url", :with=> "dsds"
      click_button "ok"
      expect(page).to have_content('Invalid Url')

    end
    end
  end
end