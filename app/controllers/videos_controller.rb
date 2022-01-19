class VideosController < ApplicationController
  def index
@page=(params[:page] || 1).to_i

@videos=Video.allmyvideos(@page)
@nbpage=(@videos[0].try(:nbtotal).to_f / Video.mylimit2.to_f).ceil
  end
    def typevideo
@page=(params[:page] || 1).to_i

@category=Category.joins(:videos).select('categories.*').where('categories.url like ?',"%#{params[:type]}%")[0]
    @videos=@category.catallmyvideos(@page)
@nbpage=(@videos[0].try(:nbtotal).to_f / 10.to_f).ceil
    end
  def show
@video=Video.find_by_urltitle(params[:title])
  end
private
def newsevents
        @alaffiche=News.alaffiche
        @someevents=Event.someevents
        @lastnews=News.fivelastnews
    end
end
