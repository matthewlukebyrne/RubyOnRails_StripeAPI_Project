Rails.application.routes.draw do
  # Generated Devise for users authentication
  devise_for :users
  # To index route then to the index of the e-commerce store
  root to: 'store#index'
  # The e-commerce store has a resource of charges controller which handles the payments for Stripe API
  resources :charges
end
