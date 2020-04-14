# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'slot_machines/:id/spin/:bet', to: 'slot_machines#spin'
      resources :slot_machines
      resources :users
      resources :slot_machine_symbol_paytables
      resources :lines
    end
  end
end
