class ErrorSerializer
	def self.empty_query
		{
			data: {
				id: nil,
				type: 'error',
				message: 'no location query entered'
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
end