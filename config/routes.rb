Rails.application.routes.draw do
  root 'payments#new'
  post 'payments/create'
end
