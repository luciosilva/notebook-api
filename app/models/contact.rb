class Contact < ApplicationRecord
  belongs_to :kind, optional: true

  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end

  def birthdate_brguhj
    "yghjklyghj"
  end

#  def author
#    name
#  end

#  def kind_description
#    self.kind.description
#  end

#  def as_json(options={})
#    super(methods: :author, only: [:name,:author])
#  end
end
