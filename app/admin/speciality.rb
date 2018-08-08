ActiveAdmin.register Speciality do
  extend Orderable

  permit_params %i[title position active]

  %i[title active].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    id_column
    column :title
    column :active
    column(:vacancies) { |speciality| speciality.vacancies.pluck(:title).join("\n") }
    actions
  end

  form do |f|
    inputs 'Создать Cпециальность' do
      f.semantic_errors
      f.input :title
      f.input :active
    end
    f.actions
  end

  show do
    attributes_table do
      %i[id title active].each { |field| row(field) }
      row(:vacancies) { |speciality| speciality.vacancies.pluck(:title).join("\n") }
    end
  end
end
