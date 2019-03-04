ActiveAdmin.register User do
  permit_params :name, :email, :password

  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete('password')
        params[:user].delete('password_confirmation')
      end
      super
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors
    inputs 'Add user' do
      f.input :name
      f.input :email
      f.input :password
      f.actions
    end
  end
end