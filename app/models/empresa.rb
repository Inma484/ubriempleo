class Empresa < ApplicationRecord
  belongs_to :user
  validates :name, :presence=> {:message =>"^ El nombre de la empresa no puede estar vacio"}

  has_attached_file :logo, :style => {:medium => "300x300>", :thumb =>"100x100#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type =>/\Aimage\/.*\Z/

end
