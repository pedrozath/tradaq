Rails.application.routes.draw do
    root to: "pages#index"
    get "anuncio_isolado", to: "pages#anuncio_isolado"
    get "categoria", to: "pages#categoria"
    get "sobre", to: "pages#sobre"
    get "faq", to: "pages#faq"
    get "contato", to: "pages#contato"
    get "permuta", to: "pages#permuta"
end