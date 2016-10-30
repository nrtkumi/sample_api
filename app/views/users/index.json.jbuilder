json.array!(@users) do |user|
  json.(user, :name, :school_id, :created_at, :updated_at)
  json.school do
    json.id user.school.id
    json.name user.school.name
    json.member user.school.member
    json.place user.school.place
    json.description user.school.description
  end
end
