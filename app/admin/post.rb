ActiveAdmin.register Post do
skip_before_action :authenticate_request
 permit_params :title, :description, :search
  

    index do
        selectable_column
        column :title
        column :description
        column :search
        column :created_at
        actions
    end

    filter :title
    filter :description
    filter :search

    show do
        attributes_table do 
        row :title
        row :description
        row :search
        row :created_at
        end
    end

    form do |f|
        f.inputs do
        f.input :title
        f.input :description
        f.input :search
        end
        f.actions
    end
end