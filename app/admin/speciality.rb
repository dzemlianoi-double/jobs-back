ActiveAdmin.register Speciality do
  config.sort_order = 'position_asc' # assuming Widget.insert_at modifies the `position` attribute
  config.paginate   = false

  reorderable

  permit_params %i[title position active]

  # Reorderable Index Table
  index as: :reorderable_table do
    column :id
    column :title
    actions
  end
end
