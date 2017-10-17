json.extract! empresa, :id, :name, :direccion, :email, :web, :phone, :user_id, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)