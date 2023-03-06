Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'preguntas/index'
      get 'preguntas/create'
      get 'preguntas/update'
      get 'preguntas/destroy'
      get 'preguntas/generar_preguntas', to: 'preguntas#generar_preguntas'
      get 'preguntas/validar_respuesta', to: 'preguntas#validar_respuesta'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
