ActiveAdmin.register Review do
  extend Orderable

  permit_params %i[first_name last_name avatar text position active]

  %i[first_name last_name active].each { |filter_name| filter(filter_name) }

  index as: :reorderable_table do
    selectable_column
    id_column
    %i[first_name last_name active].each { |field| column(field) }
    column(:text) { |review| review.text.truncate(255) }
    column(:avatar) { |review| image_tag url_for(review.avatar, class: 'max-width-200') }
    actions
  end

  form do |f|
    inputs 'Создать отзыв' do
      f.semantic_errors
      %i[first_name last_name active text].each { |field| f.input(field) }
      f.input :avatar, as: :file, hint: image_tag(url_for(f.object.avatar), class: 'max-width-200')
    end
    f.actions
  end

  show do
    attributes_table do
      %i[first_name last_name active text].each { |field| row(field) }
      row(:avatar) { |review| image_tag url_for(review.avatar, class: 'max-width-200') }
    end
  end
end
