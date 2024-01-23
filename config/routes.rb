Rails.application.routes.draw do
  namespace :api do
  resources :spacecrafts, only: [] do
    collection do
      post 'simulate'
    end
  end
end


end
