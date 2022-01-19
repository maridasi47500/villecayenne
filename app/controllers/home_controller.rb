class HomeController < ApplicationController
    before_action :newsevents
    def search
            redirect_to search_path(s: params[:s])
    end
def not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  def index
	@news=News.mynews
        @events=Event.myevents
        @notes=Note.mynotes
        
        @somenews=News.somenews
        @weather=Wforecast.weathertoday
  end
    def rubrique
    @rubrique=Rubrique.find_by_url(params[:rubriquesite])
    end
    private
    def newsevents
        @alaffiche=News.alaffiche
        @someevents=Event.someevents
    end
end
