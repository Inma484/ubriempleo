module PermissionsConcern #Concern, reciclar codigo, lo incluimos mediante include NombreConcern
	extend ActiveSupport::Concern
	
	def is_normal_user?
		self.permission_level >= 1
	end

	def is_editor?
		self.permission_level >= 2
	end

	def is_admin?
		self.permission_level >= 3
	end
end