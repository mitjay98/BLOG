Rails.application.routes.draw do
  resources :questions , only: %i[new index edit create update destroy show]
  root "pages#index"
end
