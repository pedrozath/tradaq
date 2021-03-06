Rails.application.routes.draw do
    resources :categories
    devise_for :users
    root to: "pages#index"
    get "anuncio_isolado", to: "pages#anuncio_isolado"
    get "categoria", to: "pages#categoria"
    get "sobre", to: "pages#sobre"
    get "faq", to: "pages#faq"
    get "contato", to: "pages#contato"
    get "permuta", to: "pages#permuta"
    get "*path", to: "pages#not_found"

end