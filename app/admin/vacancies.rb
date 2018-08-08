ActiveAdmin.register Vacancy do
  permit_params %i[title country city salary_min salary_max offers_quantity
                   age_min age_max is_hot is_on_main active info position]
end
