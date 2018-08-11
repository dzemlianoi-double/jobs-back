module AdminHelpers
  module ViewHelper
    def admin_url(entity)
      Rails.env.production? ? entity.service_url : url_for(entity)
    end

    def admin_image_view(entity, field)
      return 'No image' if !entity.present? || !entity.persisted?
      image_tag(admin_url(entity.public_send(field)), class: 'max-width-200')
    end
  end
end
