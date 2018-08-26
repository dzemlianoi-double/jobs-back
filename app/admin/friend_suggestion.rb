ActiveAdmin.register FriendSuggestion do
  permit_params %i[name phone_number vacancy_id]

  %i[name phone_number vacancy].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    column :name
    column :phone_number
    column :vacancy_id
    actions
  end

  form do |f|
    inputs 'Создать Cпециальность' do
      f.semantic_errors
      f.input :name
      f.input :phone_number
      f.input :vacancy
    end
    f.actions
  end

  show do
    attributes_table do
      %i[name phone_number vacancy].each { |field| row(field) }
    end
  end
end
