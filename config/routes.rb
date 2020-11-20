Rails.application.routes.draw do
	root 'posts#index'
	
	resources :members
	
	resources :posts do
		resources :comments, only:[:create, :destroy]
	end
	
	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#delete'
end
