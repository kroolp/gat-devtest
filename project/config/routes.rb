Rails.application.routes.draw do
  root controller: :pages, action: :root

  namespace :api do
    namespace :v1 do
      resources :sessions, only: %i[create]

      get 'locations/:country_code', to: 'locations#index', constraints: { country_code: /[A-Z]{2}/ }
      get 'target_groups/:country_code', to: 'target_groups#index', constraints: { country_code: /[A-Z]{2}/ }

      namespace :private do
        get 'locations/:country_code', to: 'locations#index', constraints: { country_code: /[A-Z]{2}/ }
        get 'target_groups/:country_code', to: 'target_groups#index', constraints: { country_code: /[A-Z]{2}/ }
      end
    end
  end
end
