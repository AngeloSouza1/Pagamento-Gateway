# Criar um admin padrão
if Admin.where(email: "admin@example.com").none?
  Admin.create!(
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password"
  )
  puts "Admin padrão criado: admin@example.com / password"
else
  puts "Admin padrão já existe."
end

# Criar um usuário padrão
if User.where(email: "user@example.com").none?
  User.create!(
    email: "user@example.com",
    password: "password",
    password_confirmation: "password"
  )
  puts "Usuário padrão criado: user@example.com / password"
else
  puts "Usuário padrão já existe."
end
