ActiveAdmin.register Service do
  extend Orderable

  permit_params %i[name full_description short_description position price active]

  %i[pame price active].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    id_column
    %i[name price active short_description].each { |field| column(field) }
    column(:full_description) { |review| review.full_description.truncate(255) }
    actions
  end

  form do |f|
    inputs 'Создать Услугу' do
      f.semantic_errors
      %i[name price active full_description short_description].each { |field| f.input(field) }
    end
    f.actions
  end

  show do
    attributes_table do
      %i[name price active full_description short_description].each { |field| row(field) }
    end
  end
end
