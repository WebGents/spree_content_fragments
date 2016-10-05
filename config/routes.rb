Spree::Core::Engine.routes.draw do
  namespace :admin, path: Spree.admin_path do
    resources :content_fragments
    resources :products do
      resources :content_fragments do
        collection do
          post :update_positions
        end
      end
    end
  end
end
