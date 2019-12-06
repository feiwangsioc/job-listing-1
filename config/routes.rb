Rails.application.routes.draw do
   devise_for :users 
   
 resource :user
   
  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      
      resources :resumes
     
    end
     resources :users do
       resource :profile, :controller => "user_profiles"
     end
     
  end
  
  
   resources :jobs do
     resources :resumes
   end

   root 'welcome#index'
   

   
end
