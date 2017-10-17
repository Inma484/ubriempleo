class Curriculum < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, :presence=> {:message =>"^ El nombre no puede estar vacio"}
  validates :apellido_1, :presence=> {:message =>"^ Primer apellido no puede estar vacio"}
  validates :apellido_2, :presence=> {:message =>"^ Segundo apellido no puede estar vacio"}
  validates :category_id, :presence=> {:message =>"^ Debes seleccionar una categoría profesional"}

#declaramos que hay un archivo adjunto llamdo avatar con dos estilos, medium y thumb y una url default con la imagen por defecto
  has_attached_file :avatar, :style => {:medium => "300x300>", :thumb =>"100x100#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type =>/\Aimage\/.*\Z/
end
