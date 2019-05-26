Rails.application.routes.draw do

  root to: "static_pages#index"

  get 'cadastro', to: 'users#new'
  get 'entrar',   to: 'sessions#new'
  get 'anexar',   to: 'anexos#index'
  post 'entrar',  to: 'sessions#create'
  post 'anexos/upload_anexo'
  post 'anexos/download_anexo'
  delete 'sair',  to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :arquivos, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :anexos, only: [:index]
  end
  resources :sessions, only: [:new, :create, :destroy]

end
