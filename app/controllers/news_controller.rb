class NewsController < ApplicationController
before_action :newsevents
  def index
@page=(params[:page] || 1).to_i

@news=News.allmynews(@page)
@nbpage=(@news[0].try(:nbtotal).to_f / 10.to_f).ceil
  end

  def show
@news=News.find_by_urltitle(params[:title])
  end
    def search
@page=(params[:page] || 1).to_i

@news=News.searchallmynews(@page,params[:s])
@nbpage=(@news[0].try(:nbtotal).to_f / 10.to_f).ceil
@nbnews=@news[0].try(:nbtotal)
content_not_found if @nbnews.nil? && @page > 1
    end

  def rubrique
@page=(params[:page] || 1).to_i

    @category=Category.find_by_url(params[:newscat])
    @news=@category.news.allmynews(@page)
@nbpage=(@news[0].try(:nbtotal).to_f / 10.to_f).ceil

end
private
def content_not_found
  render file: "#{Rails.root}/public/404", layout: true, status: :not_found
end
def newsevents
        @alaffiche=News.alaffiche
        @someevents=Event.someevents
        @lastnews=News.fivelastnews
    end
end
