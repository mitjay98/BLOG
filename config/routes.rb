require 'sidekiq/web'

class AdminConstraint
  def matches?(request)
    user_id = request.session[:user_id] || request.cookie_jar.encrypted[:user_id]

    User.find_by(id: user_id)&.admin_role?
  end
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq '

  namespace :api do
    resources :tags, only: :index
  end

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resource :session, only: %i[new create destroy]
    resource :password_reset, only: %i[new create edit update]
    resources :users, only: %i[new create edit update ]
    resources :users do
      member do
        get   :oauth
        patch :oauth_user_registration
      end
    end

    resources :questions do
      resources :comments, only: %i[create destroy]
      resources :answers, except: %i[new show]
    end

    resources :answers, except:  %i[new show] do
      resources :comments, only: %i[create destroy]
    end
    root 'pages#index'

    namespace :admin do
      resources :users, only: %i[index create edit update destroy]
    end

    get 'auth/:provider/callback', to: 'sessions#omniauth'
  end
end
