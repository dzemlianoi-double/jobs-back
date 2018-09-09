ActiveAdmin.register VacancyPhoto do
  extend Orderable

  menu parent: I18n.t('active_admin.additional_fields.photos')

  permit_params %i[name is_main image position vacancy_id]

  %i[name is_main vacancy].each { |filter_name| filter(filter_name) }

  vacancies = Vacancy.all.map { |item| ["#{item.title} - #{item.city}", item.id] }

  index as: :reorderable_table do
    selectable_column
    %i[name is_main vacancy].each { |field| column(field) }
    column(:image) { |photo| admin_image_view(photo, :image) }
    actions
  end

  form do |f|
    inputs 'Создать фотографию к вакансии' do
      f.semantic_errors
      %i[name is_main].each { |field| f.input(field) }
      f.input :vacancy, collection: vacancies
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
