# json.array! @users, partial: 'users/user', as: :user
json.array!(@user) do |user|
  json.name        user.name
  json.email       user.email

end
