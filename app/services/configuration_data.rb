class ConfigurationData
  def emails
    Configuration.email.pluck(:value)
  end

  def phone_numbers
    Configuration.phone_number.pluck(:key, :value).to_h
  end

  def social_links
    Configuration.social_link.pluck(:key, :value).to_h
  end

  def coordinates
    Configuration.coordinate.first
  end

  def addresses
    Configuration.address.pluck(:key, :value).to_h
  end

  def other
    Configuration.other
  end

  def basic_data
    {
      emails: emails,
      phone_numbers: phone_numbers,
      social_links: social_links,
      coordinates: coordinates,
      addresses: addresses,
      reviews: ActiveModel::SerializableResource.new(Review.active.by_position).as_json,
      vacancies: ActiveModel::SerializableResource.new(Vacancy.active.latest).as_json,
      services: ActiveModel::SerializableResource.new(Service.active.by_position.for_main).as_json
    }
  end

  def full_data
    basic_data.merge(other: other)
  end
end
