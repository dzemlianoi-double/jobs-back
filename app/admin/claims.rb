ActiveAdmin.register Claim do
  extend Orderable

  permit_params %i[email phone_number text name position source vacancy_id]

  %i[name email phone_number source vacancy].each { |field| filter(field) }

  index as: :reorderable_table do
    selectable_column
    %i[name email phone_number source reasonable].each { |field| column(field) }
    column(:text) { |claim| claim.text.try(:truncate, 255) }
    actions
  end

  form do |f|
    inputs 'Создать заявку' do
      f.semantic_errors
      %i[name email phone_number source text vacancy].each { |field| f.input(field) }
    end
    f.actions
  end

  show do
    attributes_table do
      %i[id name email phone_number source text vacancy].each { |field| row(field) }
    end
  end
end
