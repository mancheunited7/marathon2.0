Rails.application.routes.draw do
  root 'top#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :mypages, only:[:index]
  resources :practices, except:[:index]
  resources :competition_results, except:[:index]
  resources :users, only:[:index]
  resources :run_friends, only:[:create, :destroy]
  resources :competition_infos, only:[:new, :index, :create]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  namespace :api, {format: 'json'} do
    resources :competition_infos do
      get :search
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
