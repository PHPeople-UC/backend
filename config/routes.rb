Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      resources :properties do
        resources :property_services
        resources :geopoints
      end
      devise_for :users, controllers: { sessions: :sessions, registrations: :registrations },
                         path_names: { sign_in: :login }

      resources :users, only: [] do
        resources :calendar_schedules, only: [:index, :create, :update, :destroy]
        resources :off_schedules, only: [:index, :create, :update, :destroy]
      end
    end
  end
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Sidekiq::Web => '/queue'
  post '/presigned_url', to: 'direct_upload#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
