#Admin
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

#Configs
Configuration.create!(key: 'main_email', value: 'petrovich@gmail.com', basic_type: 1)
Configuration.create!(key: 'main_email', value: 'ivanko@gmail.com', basic_type: 1)
Configuration.create!(key: 'main_email', value: 'vasiliy@gmail.com', basic_type: 1)
Configuration.create!(key: 'dnepr_address', value: "st. Moskovskay", basic_type: 2)
Configuration.create!(key: 'kiev_address', value: "st. Chernoarmiyskay, 47", basic_type: 2)
Configuration.create!(key: 'life_number', value: '+380637412138', basic_type: 3)
Configuration.create!(key: 'kyivstar_number', value: '+380978547259', basic_type: 3)
Configuration.create!(key: 'map_coordinate', value: '43.652935, -79.370569', basic_type: 4)
Configuration.create!(key: 'map_coordinate', value: '50.435979, 30.516081', basic_type: 4)
Configuration.create!(key: 'twitter', value: 'https://twitter.com/', basic_type: 5)
Configuration.create!(key: 'pinterest', value: 'https://www.pinterest.ca/', basic_type: 5)
