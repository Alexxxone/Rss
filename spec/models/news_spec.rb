require 'spec_helper'
describe News do

  describe "when url is not present" do
    before { @news.url = " " }
    it { should_not be_valid }
  end
end