Rails.application.routes.draw do
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :holidays, only: [:create, :destroy, :index, :show, :update] do
    resources :recipients, only: [:create, :destroy, :index, :show, :update] do
      resources :gift_ideas, only: [:create, :destroy, :index, :update]
    end
  end
end

# 3 things happening:
# register
# login
# logout

# 2 resources:
# new
# edit
