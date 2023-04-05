ActiveAdmin.register User do
 skip_before_action :authenticate_request
 permit_params :first_name, :last_name, :age
  

    index do
        selectable_column
        column :first_name
        column :last_name
        column :age
        column :created_at
        actions
    end

    filter :first_name
    filter :last_name
    filter :age

    # show do
    #     row :first_name
    #     row :last_name
    #     row :age
    #     row :created_at
    # end

    form do |f|
        f.inputs do
        f.input :first_name
        f.input :last_name
        f.input :age
        end
        f.actions
    end
end