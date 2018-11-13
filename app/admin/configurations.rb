ActiveAdmin.register Configuration do
  extend Orderable

  %i[key value position basic_type].each { |field| filter(field) }

  permit_params :key, :value, :basic_type

  index as: :reorderable_table do
    selectable_column
    %i[key value basic_type].each { |field| column(field) }
    actions
  end

  form do |f|
    inputs 'Создать настройку' do
      f.semantic_errors
      %i[key value position basic_type].each { |field| f.input(field) }
    end
    f.actions
  end

  show do
    attributes_table do
      %i[id key value position basic_type].each { |field| row(field) }
    end
  end
end
