ActiveAdmin.register Service do
  extend Orderable

  permit_params %i[name full_description short_description position price active]

  %i[pame price active].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    id_column
    %i[name price active short_description].each { |field| column(field) }
    column(:full_description) { |review| review.full_description.truncate(255) }
    column(:main_img) { |service| image_tag(url_for(service.service_photos.main_photo.image), class: 'max-width-200') }
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
      row(:photos) do |service|
        ul do
          service.service_photos.map do |photo|
            li do
              image_tag(url_for(photo.image), class: 'max-width-200')
            end
          end
        end
      end
    end
  end
end
