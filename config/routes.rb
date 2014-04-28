Rails.application.routes.draw do

  get '/', to: 'pages#index'

  resources :images
  resources :videos
  resources :vimeo_videos

end
