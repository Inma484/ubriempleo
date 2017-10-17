class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  	devise :omniauthable, omniauth_providers: [:facebook]

    validates :username, presence: true, uniqueness: true, 
              length: {in: 5..20, too_short: "al menos 5 caracteres", too_long: "Maximo 20 catacteres"},
              format: {with: /([A-Za-z0-9\-\_]+)/, message:" Userame: solo letras, numeros y guines - y _"}


    has_many :posts
    has_many :friendships,  foreign_key: "user_id", dependent: :destroy

    #la tabla follows no existe le indicamos que tiene que buscarlo en la tabla fiendschips y buscar user_id
    has_many :follows, through: :friendships, source: :friend

    #la tabla followers_fiendships no esiste, le decimos que clase tiene que buscar.no lo hacemos igual que el de arriba porque nos devolveria lo mismo, asi qye jugamos con los id para
    #que nos devuelva lo que queremos
    has_many :followers_friendships, class_name: "Friendships", foreign_key: "friend_id"
    
    has_many :followers , through: :followers_friendships , source: :user

    #recibimos el id del usuario que vamos a seguir
    def follow!(amigo_id)
      friendships.create!(friend_id: amigo_id)#hacemos un create diciendole friend_id = amigo_id
    end

    #evitamos que se dupliquen los seguidores y que un usuario no pueda ser su propio seguidor
    def can_follow?(amigo_id)
      not amigo_id == self.id or friendships.where(friend_id: amigo_id).size > 0 #validamos que amigo_id no sea yo y buscamos si ya existe esa relacion, si encuentra un friend_id iagual 
                                                                                #que el que recibimos(>1) no podremos crear la relacion
    end

   # validate :validacion_personalizada, on: :create


   	def self.find_or_create_by_omniauth(auth)
   		user = User.where(provider: auth[:provider], uid: auth[:uid]).first

   		unless user
   			user = User.create(
   				name: auth[:name],
   				apellido: auth[:apellido],
   				username: auth[:username],
   				email: auth[:email],
   				provider: auth[:provider],
   				uid: auth[:uid],
   				password: Devise.friendly_token[0,20] #cadena de caracteres aleatorias simulando la contraseña
   			)
   		end
   		user
  	end

    #private
    #def validacion_personalizda
    #  if true
    # else
    #    errors.add(:username, "username no valido")  
    #  end
    #end
end
