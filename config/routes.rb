Rails.application.routes.draw do
  resources :records do
    collection do
      get 'daily_summary'
    end
  end
  root "records#index"
end
