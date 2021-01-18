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
end