class ForecastSerializer
	include FastJsonapi::ObjectSerializer
	set_id nil
	set_type :forecast
	attributes :date_time, :sunrise, :sunset, :temp
end