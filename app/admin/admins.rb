ActiveAdmin.register Admin do
  permit_params :email, :password, :password_confirmation

  filter :email

  index do
    selectable_column
    column :email
    column :current_sign_in_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
