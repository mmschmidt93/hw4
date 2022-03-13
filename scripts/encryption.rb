secret = "tacos"
puts secret

encrypted_secret = BCrypt::Password.create(secret)
puts encrypted_secret

secret_to_test = "tacos"
result = BCrypt::Password.new(encrypted_secret) == secret
