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
end