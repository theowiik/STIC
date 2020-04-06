# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'slot_machines/:id/spin', to: 'slot_machines#spin'
      resources :slot_machines
    end
  end
end
