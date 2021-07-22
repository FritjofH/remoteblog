Rails.application.routes.draw do
  resources :elements
  devise_for :authors, controllers: { registrations: "registrations" }
  get 'home/index'
  root to: "readers/home#index"
  
  scope module: 'readers' do
    get '/tagged' => "posts#tagged", as: :tagged
    get '/blog/:id' => 'posts#show', as: :blog_post
    get '/about' => 'about#show'
  end
  
  scope module: 'authors' do
    resources :about, controller: "about", except: [:index, :show, :delete, :update] do
      resources :about_list_texts
    end
    patch '/about/:id/edit' => 'about#update'
    get '/stats' => 'stats#index'
    resources :posts do
      resources :elements
    end
  end
end
