Rails.application.routes.draw do
  root controller: :pages, action: :root

  namespace :api do
    namespace :v1 do
      get 'locations/:country_code', to: 'locations#index', constraints: { country_code: /[A-Z]{2}/ }

      namespace :private do
        get 'locations/:country_code', to: 'locations#index', constraints: { country_code: /[A-Z]{2}/ }
      end
    end
  end
end
