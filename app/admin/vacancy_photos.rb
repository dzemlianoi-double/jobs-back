ActiveAdmin.register VacancyPhoto do
  extend Orderable

  permit_params %i[name is_main image position vacancy_id]

  %i[name is_main vacancy].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    id_column
    %i[name is_main vacancy].each { |field| column(field) }
    column(:image) { |photo| admin_image_view(photo, :image) }
    actions
  end

  form do |f|
    inputs 'Создать отзыв' do
      f.semantic_errors
      %i[name is_main vacancy].each { |field| f.input(field) }
      f.input :image, as: :file, hint: admin_image_view(f.object, :image)
    end
    f.actions
  end

  show do
    attributes_table do
      %i[name is_main vacancy].each { |field| row(field) }
      row(:image) { |photo| admin_image_view(photo, :image) }
    end
  end
end
