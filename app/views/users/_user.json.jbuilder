json.extract! user, :id, :name, :email, :password, :reg_type, :token, :img, :created_at, :updated_at
json.url user_url(user, format: :json)
