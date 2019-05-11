class Vendor < ActiveRecord::Base
  validate :picture_has_correct_format

  def picture_has_correct_format
    unless picture.blank? || picture.downcase.start_with?('https://', 'http://')
      errors.add(:picture, 'must start with https:// or http://')
    end
  end
  validates :name, presence: true, uniqueness: true

  has_many :products, dependent: :destroy
  has_many :vendor_ownerships, dependent: :destroy
  has_many :ownerships, through: :vendor_ownerships, dependent: :destroy

  accepts_nested_attributes_for :ownerships, :allow_destroy => true

  def self.get_ownerships_hash
    @vendors = self.all
    @ownerships_hash = {}
    @vendors.each do |vendor|
      vendor.ownerships.each do |ownership|
        if @ownerships_hash.key?(ownership.name)
          @ownerships_hash[ownership.name].push(vendor)
        else
          @ownerships_hash[ownership.name] = [vendor]
        end
      end
    end
    @ownerships_hash
  end
end
