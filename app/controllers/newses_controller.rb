class NewsesController < ApplicationController
  def new
    @news = News.new

  end

  def index
    @news = News.order("created_at DESC").paginate(page: params[:page], per_page: 10)
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
