Rails.application.routes.draw do
    root to: "pages#index"
    get "anuncio_isolado", to: "pages#anuncio_isolado"
end