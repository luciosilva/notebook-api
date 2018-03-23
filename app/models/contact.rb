class Contact < ApplicationRecord
  def author
    name
  end

  def as_json(options={})
    super(methods: :author, only: [:name,:author])
  end
end
