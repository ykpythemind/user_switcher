pass = "password"
User.find_or_create_by!(email: "ykpythemind@example.com") do |u|
  u.attributes = {password: pass, password_confirmation: pass}
end

User.find_or_create_by!(email: "mckaoru@example.com") do |u|
  u.attributes = {password: pass, password_confirmation: pass}
end
