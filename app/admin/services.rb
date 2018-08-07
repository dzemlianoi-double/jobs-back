ActiveAdmin.register Service do
  permit_params %i[name full_description photo position price active]
end
