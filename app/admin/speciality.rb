ActiveAdmin.register Speciality do
  extend Orderable

  permit_params %i[title position active position]

  %i[title active].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    column :title
    column :active
    actions
  end

  form do |f|
    inputs 'Создать Cпециальность' do
      f.semantic_errors
      f.input :title
      f.input :active
      f.input :position
    end
    f.actions
  end

  show do
    attributes_table do
      %i[id title active position].each { |field| row(field) }
      row I18n.t('active_admin.additional_fields.vacancies') do |speciality|
        ul { speciality.vacancies.map { |vacancy| li { link_to vacancy.title, admin_vacancy_path(vacancy) } } }
      end
    end
  end
end
