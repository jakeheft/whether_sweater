class ErrorSerializer
	def self.empty_query
		{
			data: {
				id: nil,
				type: 'error',
				message: 'missing location'
			}
		}
	end

	def self.invalid_location(message)
		{
			data: {
				id: nil,
				type: 'error',
				message: message
			}
		}
	end

	def self.duplicate_email
		{
			data: {
				id: nil,
				type: 'error',
				message: 'this email already exists in the system'
			}
		}
	end

	def self.passwords_dont_match
		{
			data: {
				id: nil,
				type: 'error',
				message: 'passwords did not match'
			}
		}
	end

	def self.no_email
		{
			data: {
				id: nil,
				type: 'error',
				message: 'email must be entered'
			}
		}
	end

	def self.invalid_credentials
		{
			data: {
				id: nil,
				type: 'error',
				message: 'invalid login credentials'
			}
		}
	end

	def self.invalid_api_key
		{
			data: {
				id: nil,
				type: 'error',
				message: 'invalid API key'
			}
		}
	end
end