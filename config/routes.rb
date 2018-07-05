Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :travels
    resources :accomodations
    resources :checklist do
      member do
        patch :complete
      end
    end
  end
end
