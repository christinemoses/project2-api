Rails.application.routes.draw do
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :holidays, except: [:new, :edit]

  resources :recipients, except: [:new, :edit]

  resources :users, except: [:new, :edit]

end

# 3 things happening:
# register
# login
# logout

# 2 resources:
# new
# edit


