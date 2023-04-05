ActiveAdmin.register Category do
 skip_before_action :authenticate_request
 permit_params :name,:description,:active
     
    index do
        selectable_column
        column :name
        column :description
        column :active
        actions
    end

        filter :name
        filter :description
        filter :active

        show do
            attributes_table do 
            row :name
            row :description
            row :active
            row :created_at
            end
        end

        form do |f|
            f.inputs do
            f.input :name
            f.input :description
            f.input :active
            end
            f.actions
        end
end