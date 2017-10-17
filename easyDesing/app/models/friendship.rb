class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User", optional: true #como no hay ninguna clase llamada friend tenemos que indicarle la clase que corresponde el belongs_to

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
