Rails.application.routes.draw do
  root 'top#index'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :mypages, only:[:index]
  resources :practices, except:[:index]
  resources :competition_results, except:[:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
