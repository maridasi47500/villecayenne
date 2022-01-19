
Rails.application.routes.draw do
    get "", to: "home#search",
constraints: lambda { |request| request.params[:s].present? },as: :chercher

    get "videos/:title", to: "videos#show", as: :showvideo
    get "/type-videos/:type", to: "videos#typevideo", as: :typevideo
    get "/type-videos/:type/page/:page", to: "videos#typevideo", as: :typevideopage
    get "videos/page/:page", to: "videos#index", as: :mesvideospage
    get "videos", to: "videos#index", as: :mesvideos
get "/type-evenement/:typeevent/", to: "events#typeevent", as: :myeventtype

    get "agenda/:title", to: "events#show",
constraints: lambda { |request| Event.find_by_urltitle(request.params[:title]).present? }, as: :showmyevent 
  
    get "agenda/page/:page", to: "events#index", as: :myagendapage
    get "agenda", to: "events#index"

    get "actualites/page/:page", to: "news#index",as: :actualitespage
    get "actualites", to: "news#index"
 
   get ":newscat", to: "news#rubrique",
constraints: lambda { |request| Category.find_by_url(request.params[:newscat]).present? },as: :eventscat
     get ":newscat/page/:page", to: "news#rubrique",
constraints: lambda { |request| Category.find_by_url(request.params[:newscat]).present? },as: :eventscatpage
  
    get ":newscat/:title", to: "news#show",
constraints: lambda { |request| Category.find_by_url(request.params[:newscat]).present? && News.find_by_urltitle(request.params[:title]).present? }, as: :showmynews  
    get "recherche/:s", to: "news#search", as: :search
    get "recherche/:s/page/:page", to: "news#search", as: :searchpage
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root to: 'home#index'
    get ":rubriquesite", to: "home#rubrique",
constraints: lambda { |request| Rubrique.find_by_url(request.params[:rubriquesite]).present? } 
  
  get '*unmatched_route', to: 'home#not_found'

end
