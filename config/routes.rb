Oratio::Application.routes.draw do

  resources :slide_types
  resources :slideshows do
    resources :slides
  end
  
  match '/auth/:provider/callback', :to => 'sessions#callback'
  match '/auth/failure', :to => 'sessions#login_failure'
  match '/auth/sign_out', :to => 'sessions#sign_out'
  
  match '/diagnostics', :to => 'diagnostics#index'
  match '/diagnostics/:action', :controller => 'diagnostics'

  match '/settings', :to => 'settings#index'
  
  root :to => "welcome#index"
  
  # See how all your routes lay out with "rake routes"
  
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
