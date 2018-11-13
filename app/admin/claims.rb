ActiveAdmin.register Claim do
  extend Orderable

  actions :all, except: %i[edit update]

  permit_params %i[email phone_number text name position position source vacancy_id]

  %i[name email phone_number source vacancy].each { |field| filter(field) }

  index as: :reorderable_table do
    selectable_column
    %i[name email phone_number source reasonable created_at].each { |field| column(field) }
    column(:text) { |claim| claim.text.try(:truncate, 255) }
    actions
  end

  form do |f|
    inputs 'Создать заявку' do
      f.semantic_errors
      %i[name email phone_number source text position reasonable].each { |field| f.input(field) }
    end
    f.actions
  end

  show do
    attributes_table do
      %i[id name email phone_number source text position reasonable created_at].each { |field| row(field) }
    end
  end
end
