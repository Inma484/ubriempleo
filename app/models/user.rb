class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy #el objeto asociado debe ser eliminado cuando su creador es eliminado
  has_one :empresa
  has_one :curriculum

  validates :role, :presence=> {:message =>"^ Rol no seleccionado, por favor elija Empresas o Demandantes"}
  
  ROLES =  %w[empresa trabajador]

  def empresa
  	self.role == "empresa"
  end

  def trabajador
  	self.role == "trabajador"
  end

  def admin
    self.role == "admin"
  end

 
  

end
