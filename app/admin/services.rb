ActiveAdmin.register Service do
  extend Orderable

  permit_params %i[name full_description position price active icon by_agreement]

  %i[pame price active].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    %i[name price active by_agreement].each { |field| column(field) }
    column(:full_description) { |service| service.full_description.truncate(255) }
    column(:icon) { |service| fa_icon((service.icon || 'user') << ' 4x') }
    column(I18n.t('active_admin.additional_fields.main_img')) do |service|
      admin_image_view(service.service_photos.main_photo, :image)
    end
    actions
  end

  form do |f|
    inputs 'Создать Услугу' do
      f.semantic_errors
      %i[name price active full_description by_agreement icon].each { |field| f.input(field) }
      f.li "<label class='label'>Выбранная иконка</label><span id='service-icon-span' class='fa fa-3x fa-#{f.object.icon || 'user'}'></span>".html_safe
      f.li "<label class='label'>Ссылка для выбора иконок</label><a href='https://fontawesome.com/icons?d=gallery&m=free' target='_blank'>Ссылка</a>".html_safe
    end
    f.actions
  end

  show do
    attributes_table do
      %i[name price active full_description by_agreement].each { |field| row(field) }
      row(:icon) { |service| fa_icon((service.icon || 'user') << ' 4x') }

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
