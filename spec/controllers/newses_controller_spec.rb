require 'spec_helper'
describe NewsesController do
  describe 'GET index' do
    it "successfully renders the index template" do
      expect(controller).to receive(:index) # this line probably of dubious value
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

  end

end