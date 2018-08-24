ActiveAdmin.register Vacancy do
  config.xls_builder.i18n_scope = %i[active_record models vacancies]

  decorate_with VacancyDecorator

  extend Orderable

  permit_params :title, :country, :city, :salary_min, :arrive_date, :video_url, :offers_quantity, :age_min, :age_max,
                :is_hot, :is_on_main, :active, :info, :sex, :experience, :position, vacancy_speciality_ids: [], speciality_ids: []

  %i[title country city is_hot is_on_main active].each { |field| filter(field) }

  index as: :reorderable_table do
    selectable_column
    %i[title country city arrive_date is_hot is_on_main active salary_min age].each do |field|
      column(field)
    end
    column(:country, &:country_name)
    column(I18n.t('active_admin.additional_fields.main_img')) do |vacancy|
      admin_image_view(vacancy.vacancy_photos.main_photo, :image)
    end
    actions
  end

  form do |f|
    f.semantic_errors

    inputs 'Расположение' do
      %i[country city].each { |field| f.input(field) }
    end

    inputs 'Детали' do
      %i[title salary_min arrive_date age_min age_max sex experience offers_quantity active video_url info].each do |field|
        f.input(field)
      end
    end

    inputs 'Тип Вакансии' do
      %i[is_hot is_on_main].each { |field| f.input(field) }
      f.input :specialities, as: :select2_multiple,
                             multiple: true,
                             input_html: { class: 'specialities-select' }
    end
    f.actions
  end

  show do
    attributes_table do
      row(:country, &:country_name)
      %i[city arrive_date is_hot is_on_main sex title experience salary_min age active info video_url].each do |field|
        row(field)
      end

      row I18n.t('active_admin.additional_fields.specialities') do |vacancy|
        ul { vacancy.specialities.map { |spec| li { link_to spec.title, admin_speciality_path(spec) } } }
      end

      row I18n.t('active_admin.additional_fields.photos') do |vacancy|
        ul do
          vacancy.vacancy_photos.map do |photo|
            li do
              admin_image_view(photo, :image)
            end
          end
        end
      end
    end
  end
end
