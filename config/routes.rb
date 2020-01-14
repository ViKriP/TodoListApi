Rails.application.routes.draw do
  root 'static_page_docs#docs'

  namespace :api do
    namespace :v1 do
      post :registration, to: 'registrations#create'
      post :sign_in, to: 'login#create'
      delete :sign_out, to: 'login#destroy'

      resources :projects, only: [:create, :update, :destroy]
    end
  end
end
