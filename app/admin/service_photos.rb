ActiveAdmin.register ServicePhoto do
  extend Orderable

  permit_params %i[name is_main image service_id position]

  %i[name is_main service].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    id_column
    %i[name is_main service].each { |field| column(field) }
    column(:main_image) do |current_service|
      image_tag(url_for(current_service.image), class: 'max-width-200')
    end
    actions
  end

  form do |f|
    inputs 'Создать отзыв' do
      f.semantic_errors
      %i[name is_main service].each { |field| f.input(field) }
      f.input :image, as: :file, hint: f.object.persisted? ? image_tag(url_for(f.object.image), class: 'max-width-200') : 'No image' # rubocop:disable Metrics/LineLength
    end
    f.actions
  end

  show do
    attributes_table do
      %i[name is_main service].each { |field| row(field) }
    end
  end
end
