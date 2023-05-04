Rails.application.routes.draw do
  resources :process_remarks
  resources :agent_positions
  resources :process_coverages do 
    get :approve_batch, on: :member
    get :deny_batch, on: :member
  end
  resources :batch_health_decs
  resources :health_dec_questions
  resources :members
  resources :proposal_insured_loadings
  resources :rate_tables
  resources :gyrt_rate_multipliers
  resources :gyrt_rates
  resources :gyrt_loadings
  resources :contestabilities
  resources :moas
  resources :proposal_officers
  resources :officers
  resources :proposal_annivs
  resources :anniv_types
  resources :plans
  resources :product_categories
  resources :product_lines
  resources :insured_types
  resources :benefits
  resources :proposals
  resources :proposal_insured_benefits
  
  resources :batch_dependents, :batches, :group_remits, :agreement_benefits, :anniversaries, :agreements, :agent_groups, :departments, :agents, :coop_users, :employees

  resources :cooperatives do
    get :selected, on: :member
    resources :coop_branches do 
    end
  end

  resources :coop_members do
    resources :coop_member_beneficiaries, path: 'beneficiaries', as: 'beneficiaries'
    resources :coop_member_dependents, path: 'dependents', as: 'dependents'
  end

  devise_for :admin_users#, ActiveAdmin::Devise.config
 # ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated :user do
        root 'application#root', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
