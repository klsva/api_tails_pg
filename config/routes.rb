Rails.application.routes.draw do

  scope module: 'api' do #scope чтобы маршруб без префикса /api
    namespace :v1 do
      resources :jobs do #jobs/3/applies/9
        resources :applies
      end
      resources :companies do #companies/3/jobs/2
        resources :jobs, only: [:index]
      end

      match 'mark_destroy', to: "companies#mark_destroy", via: :post

      resources :geeks do #geeks/3/applies/9
        resources :applies
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all


end
