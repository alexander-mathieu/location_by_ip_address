Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'locationByIp', to: 'location_by_ip#index'
    end
  end
end
