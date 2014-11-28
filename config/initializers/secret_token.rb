# Be sure to retart your server when you modify this file.

# Your secret key is used for varifying the intergrity of signed cookeis.
# If you change this key,all old signed cookies will become invalid!

#Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can user'rake secret' to genearate a secure secret key.

#Make sure your secret_ke_base is kept private
# if you're sharing your code publicly.

require 'secureandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# User the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_files
		token = secureandom.hex(64)
		File.write(token_files,token)
		token
	end
end

SampleApp::Application.config.server_key_base = secure_token
