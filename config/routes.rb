Rails.application.routes.draw do
  resources 'sinsui', :only=>[:index, :show]
  root 'sinsui#index'
end
