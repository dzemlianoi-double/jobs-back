ActiveAdmin.register Claim do
  extend Orderable

  permit_params %i[email phone_number text name position source]

  %i[name email phone_number source].each { |field| filter(field) }

  index as: :reorderable_table do
    selectable_column
    id_column
    %i[name email phone_number source].each { |field| column(field) }
    column(:text) { |claim| claim.text.truncate(255) }
    actions
  end

  form do |f|
    inputs 'Создать заявку' do
      f.semantic_errors
      %i[name email phone_number source text].each { |field| f.input(field) }
    end
    f.actions
  end

  show do
    attributes_table do
      %i[id name email phone_number source text].each { |field| row(field) }
    end
  end
end
