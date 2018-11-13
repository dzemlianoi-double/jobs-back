ActiveAdmin.register ServicePhoto do
  extend Orderable

  menu parent: I18n.t('active_admin.additional_fields.photos')

  permit_params %i[name is_main image service_id position]

  %i[name is_main service].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    %i[name is_main service].each { |field| column(field) }
    column(:image) { |current_service| admin_image_view(current_service, :image) }
    actions
  end

  form do |f|
    inputs 'Создать отзыв' do
      f.semantic_errors
      %i[name is_main position service].each { |field| f.input(field) }
      f.input :image, as: :file, hint: admin_image_view(f.object, :image)
    end
    f.actions
  end

  show do
    attributes_table do
      %i[name is_main position sservice].each { |field| row(field) }
      row(:image) { |current_service| admin_image_view(current_service, :image) }
    end
  end
end
