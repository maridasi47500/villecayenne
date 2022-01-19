class EventsController < ApplicationController
before_action :newsevents
  def index
@page=(params[:page] || 1).to_i
@events=Event.allmyevents(@page)
@nbpage=(@events[0].try(:nbtotal).to_f / 2.to_f).ceil

  end

  def show
@event=Event.find_by_urltitle(params[:title])

  end
private
def newsevents
        @alaffiche=News.alaffiche
        @someevents=Event.someevents
    end
end
