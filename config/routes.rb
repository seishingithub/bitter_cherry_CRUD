Rails.application.routes.draw do

  get '/', to: 'pages#index'

  resources :pictures
  resources :videos
  resources :vimeo_videos

end
