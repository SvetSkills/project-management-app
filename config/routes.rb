Rails.application.routes.draw do
  # get 'accounts/create'
  # get 'accounts/new'
  resources :projects   #, :accounts

  # root 'accounts#organisation'
  root "home#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  devise_for :accounts, controllers:{
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions',
  }
  scope controller: :static do
    get :pricing
  end
  post "checkout/create", to: "checkout#create", as: "checkout_create"
  post "billing_portal/create", to: "billing_portal#create", as: "billing_portal_create"
  get "success", to: "checkouts#success"
end