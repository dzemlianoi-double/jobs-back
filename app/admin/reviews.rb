ActiveAdmin.register Review do
  permit_params %i[first_name last_name avatar text position active]
end
