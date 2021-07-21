Rails.application.routes.draw do
  resources :elements
  devise_for :authors, controllers: { registrations: "registrations" }
  get 'home/index'
  root to: "readers/home#index"
  
  scope module: 'readers' do
    get '/tagged' => "posts#tagged", as: :tagged
    get '/about' => 'about#index'
    get '/blog/:id' => 'posts#show', as: :blog_post
  end
  
  
  scope module: 'authors' do
    get 'stats' => 'stats#index'
    resources :posts do
      resources :elements
    end
  end
end
