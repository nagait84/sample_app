# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token =SecureRandom.hex(64)
    File.write(token_file,token)
    token
  end
end

SampleApp::Application.config.secret_key_base = 'f14dd1c4771d009fe36b4137b308e2b5be6797df74699b8e057ab9d0f0c42cf5a7e114fe1a303bfdf15b841fc336e736ff4cde168bb10efb10d18614f29ff7d8'
