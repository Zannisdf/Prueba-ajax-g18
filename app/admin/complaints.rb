ActiveAdmin.register Complaint do
  permit_params :user_id, :company_id, :content
  index do
    selectable_column
    id_column
    column :user
    column :company
    column :content
    column :created_at
    actions
  end

  filter :company
  filter :user
  filter :content
  filter :created_at
end
