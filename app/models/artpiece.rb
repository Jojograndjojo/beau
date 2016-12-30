class Artpiece < ApplicationRecord
  has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates :image, attachment_presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, uniqueness: true, presence: true
  validates :type_of_art, presence: true
end
