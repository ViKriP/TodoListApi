Rails.application.routes.draw do
  root 'static_page_docs#docs'

  namespace :api do
    namespace :v1 do
      post :registration, to: 'registrations#create'
      post :sign_in, to: 'login#create'
      delete :sign_out, to: 'login#destroy'

      resources :projects, only: %i[create update destroy] do
        resources :tasks, only: :create
      end

      resources :tasks, shallow: true do
        resources :comments, only: :create
      end

      resources :tasks, only: [:update, :destroy]
      resources :comments, only: :destroy
    end
  end
end
