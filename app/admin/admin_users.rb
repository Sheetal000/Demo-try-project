ActiveAdmin.register AdminUser do
  skip_before_action :authenticate_request
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :first_name
    column :last_name
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :first_name
  filter :last_name
  

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # show do |data|
  #   attributes_table do  
  #     row :user_id
  #     row :first_name
  #     row :last_name
  #     row :email
  #     row :mobile_number
  #     row :created_at
  #     row :updated_at
  #     panel 'Post' do
  #       table_for data.post do
  #           column :id
  #           column :title
  #           column :description
  #           column :search
  #       end
  #    end
  #   end   
  # end
controller do
  before_action :my_create
  def my_create
    
  end
end
end
