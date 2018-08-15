ActiveAdmin.register Review do
  extend Orderable

  permit_params %i[first_name last_name avatar text position active]

  %i[first_name last_name active].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    %i[first_name last_name active].each { |field| column(field) }
    column(:text) { |review| review.text.truncate(255) }
    column(:avatar) { |review| admin_image_view(review, :avatar) }
    actions
  end

  form do |f|
    inputs 'Создать отзыв' do
      f.semantic_errors
      %i[first_name last_name active text].each { |field| f.input(field) }
      f.input :avatar, as: :file, hint: admin_image_view(f.object, :avatar)
    end
    f.actions
  end

  show do
    attributes_table do
      %i[first_name last_name active text].each { |field| row(field) }
      row(:avatar) { |review| admin_image_view(review, :avatar) }
    end
  end
end
