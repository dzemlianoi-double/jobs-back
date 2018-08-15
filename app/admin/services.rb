ActiveAdmin.register Service do
  extend Orderable

  permit_params %i[name full_description short_description position price active]

  %i[pame price active].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    %i[name price active short_description].each { |field| column(field) }
    column(:full_description) { |review| review.full_description.truncate(255) }
    column(I18n.t('active_admin.additional_fields.main_img')) do |service|
      admin_image_view(service.service_photos.main_photo, :image)
    end
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
      row I18n.t('active_admin.additional_fields.photos') do |service|
        ul do
          service.service_photos.map do |photo|
            li do
              admin_image_view(photo, :image)
            end
          end
        end
      end
    end
  end
end
