ActiveAdmin.register Claim do
  permit_params %i[email phone_number info name position]
end
