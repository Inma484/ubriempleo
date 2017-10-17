class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	validates :title, :presence=> {:message =>"^ El título no puede estar vacio"}
	validates :category_id, :presence=> {:message =>"^Debes seleccionar una categoría"}
	
	scope :ultimos, ->{order('greatest(created_at, updated_at)DESC')}#creamos un scope que nos muestros los post ordenados descendentemente segun fecha de cracion o acutlizacion

end
