class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #invitado, ususario no logeado

    alias_action :create, :update,:destroy, :to =>:crud


    if user.role == "admin"
      can :manage, :all
    end

    if user.role == "empresa"
        can :create, [Post, Empresa]
        can :read, [Post, Empresa], :user_id => user.id
        can :update, [Post, Empresa] do |post|
            post.try(:user) == user #solo podrá leer o actualizar sus post o sus datos de empresa
        end
        can :destroy, [Post, Empresa],:user_id => user.id
        cannot :crud , [Category,Curriculum]
        can :read, Curriculum
    end

    if user.role == "trabajador"
        can :read, [Post, Empresa]
        cannot :crud, [Category, Empresa] #no podra crear, actualizar o destruir las categorias
        can :create, Curriculum
        can :read, Curriculum , :user_id => user.id
        can :update, Curriculum, :user_id => user.id
        can :destroy, Curriculum, :user_id => user.id
        
    end
  end
end
