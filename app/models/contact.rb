class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true#, allow_destroy: true

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

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
