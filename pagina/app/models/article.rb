class Article < ApplicationRecord
    include AASM #MAQUINA DE ESTADOS
	belongs_to :user
    has_many :comments
    has_many :has_categories
    has_many :categories, through: :has_categories


	validates :title, presence: true,
                    length: { minimum: 5 }
    validates :body, presence: true, length: {minimum: 20}
    before_save :set_visits_count
    after_create :save_categories

    has_attached_file :cover, :style=> {medium: "300x300", thumb:"100x100" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/ 

    def update_visits_count
    	self.update(visits_count: self.visits_count + 1)
    end

    def categories=(value)#custom setter, metodo que nos permite signar valor al atributo de un objeto
        @categories = value
    end
    #los scopes son condiciones que se añaden al modelo para definir diferentes grupos de registros que hay en una tabla
    #ambas declaraciones son iguales, pero no squedamos con este tipo de sintasis por ser una perculariedad de ruby
    scope :publicados, ->{where(state: "published")}
    scope :ultimos, ->{order("created_at DESC")}#creamos un scope que nos muestre los articuilos ordenados descendientemente

    #def self.publicados
     #   Article.where(state:"published")
    #end

    aasm column: "state" do
        state :in_draft, initial: true #borrador
        state :published

        event :publish do
            transitions from: :in_draft, to: :published
        end

        event :unpublish do
            transitions from: :published, to: :in_draft
        end
    end


    private
    def set_visits_count
    	self.visits_count ||= 0  #si el valor que recibo es nulo, asignamos 0 si no, no hace nada  	
    end

    def save_categories#
        @categories.each do |category_id|
            HasCategory.create(category_id: category_id, article_id: self.id)#Creamos registros de la tabla HasCategory
                                                                            #con el id del la categoria y del articulo 
                                                                            # (self= referencia del objeto con el que estamos trabajnado)
        end
    end
end
