Rails.application.routes.draw do
  root 'application#docs'

  namespace :api do
    namespace :v1 do
      post :registration, to: 'registrations#create'
      post :sign_in, to: 'login#create'
      delete :sign_out, to: 'login#destroy'
    end
  end
end
