class Kind < ApplicationRecord
  has_many :contact
  def as_json(options={})
    super(except: [:created_at,:updated_at])
  end

end
