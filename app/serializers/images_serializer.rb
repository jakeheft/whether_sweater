class ImagesSerializer
	include FastJsonapi::ObjectSerializer
	set_id { nil }
	attributes :location, :image_url, :photographer, :photographer_url, :site_credit
end