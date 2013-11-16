class NewsesController < ApplicationController
  def new
    @news = News.new

  end

  def index
    @news = News.all
  end
  def show
    @news = News.first
  end
  def create
    if @news = News.update_from_feed(params[:news][:url])
      redirect_to action: :index
    else
      redirect_to :back
      flash[:notice] = "Invalid Url"
    end

  end

end
