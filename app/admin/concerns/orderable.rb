module Orderable
  extend ActiveSupport::Concern

  def self.extended(base)
    base.instance_eval do
      config.sort_order = 'position_asc'

      reorderable
    end
  end
end
