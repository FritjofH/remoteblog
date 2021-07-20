Rails.application.routes.draw do
  resources :elements
  devise_for :authors, controllers: { registrations: "registrations" }
  get 'home/index'
  get '/about', to: 'readers/about#index'
  
  root to: "readers/home#index"
  get '/blog/:id' => 'readers/posts#show', as: :blog_post
  
  scope module: 'authors' do
    get 'stats' => 'stats#index'
    resources :posts do
      resources :elements
    end
  end
end
