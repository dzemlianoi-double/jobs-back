ActiveAdmin.register Vacancy do
  decorate_with VacancyDecorator

  extend Orderable

  permit_params :title, :country, :city, :salary_min, :salary_max, :offers_quantity, :age_min, :age_max,
                :is_hot, :is_on_main, :active, :info, :position, speciality_vacancies_ids: []

  %i[title country city is_hot is_on_main active].each { |field| filter(field) }

  index as: :reorderable_table do
    selectable_column
    %i[title country city is_hot is_on_main active salary age].each { |field| column(field) }
    column(:main_img) { |vacancy| image_tag(url_for(vacancy.vacancy_photos.main_photo.image), class: 'max-width-200') }
    actions
  end

  form do |f|
    f.semantic_errors

    inputs 'Расположение' do
      %i[country city].each { |field| f.input(field) }
    end

    inputs 'Детали' do
      %i[title salary_min salary_max age_min age_max offers_quantity active info].each { |field| f.input(field) }
    end

    inputs 'Тип Вакансии' do
      %i[is_hot is_on_main].each { |field| f.input(field) }
    end
    f.actions
  end

  show do
    attributes_table do
      %i[country city is_hot is_on_main title salary age offers_quantity active info].each { |field| row(field) }
      row(:photos) do |vacancy|
        ul do
          vacancy.vacancy_photos.map do |photo|
            li do
              image_tag(url_for(photo.image), class: 'max-width-200')
            end
          end
        end
      end
    end
  end
end
