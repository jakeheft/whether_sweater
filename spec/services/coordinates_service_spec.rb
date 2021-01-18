require 'rails_helper'

describe CoordinatesService do
	it 'can get coordinates with city, state' do
		location = 'denver,co'

		coordinate_data = CoordinatesService.fetch_coordinates(location)
		expect(coordinate_data).to be_a(Hash)
		expect(coordinate_data).to have_key(:info)
		expect(coordinate_data).to have_key(:options)
		expect(coordinate_data).to have_key(:results)
		
		info = coordinate_data[:info]
		options = coordinate_data[:options]
		results = coordinate_data[:results]

		expect(info).to be_a(Hash)
		expect(info).to have_key(:statuscode)
		expect(info[:statuscode]).to be_an(Integer)
		expect(info).to have_key(:copyright)
		expect(info[:copyright]).to be_an(Hash)
		expect(info[:copyright]).to have_key(:text)
		expect(info[:copyright][:text]).to be_a(String)
		expect(info[:copyright]).to have_key(:imageUrl)
		expect(info[:copyright][:imageUrl]).to be_a(String)
		expect(info[:copyright]).to have_key(:imageAltText)
		expect(info[:copyright][:imageAltText]).to be_a(String)
		expect(info).to have_key(:messages)
		expect(info[:messages]).to be_an(Array)

		expect(options).to be_a(Hash)
		expect(options).to have_key(:maxResults)
		expect(options[:maxResults]).to be_an(Integer)
		expect(options).to have_key(:thumbMaps)
		expect(options[:thumbMaps]).to eq(true).or eq(false)
		expect(options).to have_key(:ignoreLatLngInput)
		expect(options[:ignoreLatLngInput]).to eq(true).or eq(false)
		expect(results).to be_an(Array)

		result = results.first

		expect(result).to be_a(Hash)
		expect(result).to have_key(:providedLocation)
		expect(result[:providedLocation]).to be_a(Hash)
		expect(result[:providedLocation]).to have_key(:location)
		expect(result[:providedLocation][:location]).to be_a(String)
		expect(result).to have_key(:locations)
		expect(result[:locations]).to be_an(Array)

		location = result[:locations].first

		expect(location).to be_a(Hash)
		expect(location).to have_key(:street)
		expect(location[:street]).to be_a(String)
 		expect(location).to have_key(:adminArea6)
		expect(location[:adminArea6]).to be_a(String)
 		expect(location).to have_key(:adminArea6Type)
		expect(location[:adminArea6Type]).to be_a(String)
 		expect(location).to have_key(:adminArea5)
		expect(location[:adminArea5]).to be_a(String)
 		expect(location).to have_key(:adminArea5Type)
		expect(location[:adminArea5Type]).to be_a(String)
 		expect(location).to have_key(:adminArea4)
		expect(location[:adminArea4]).to be_a(String)
 		expect(location).to have_key(:adminArea4Type)
		expect(location[:adminArea4Type]).to be_a(String)
 		expect(location).to have_key(:adminArea3)
		expect(location[:adminArea3]).to be_a(String)
 		expect(location).to have_key(:adminArea3Type)
		expect(location[:adminArea3Type]).to be_a(String)
 		expect(location).to have_key(:adminArea1)
		expect(location[:adminArea1]).to be_a(String)
 		expect(location).to have_key(:adminArea1Type)
		expect(location[:adminArea1Type]).to be_a(String)
 		expect(location).to have_key(:postalCode)
		expect(location[:postalCode]).to be_a(String)
 		expect(location).to have_key(:geocodeQualityCode)
		expect(location[:geocodeQualityCode]).to be_a(String)
 		expect(location).to have_key(:geocodeQuality)
		expect(location[:geocodeQuality]).to be_a(String)
 		expect(location).to have_key(:dragPoint)
		expect(location[:dragPoint]).to eq(true).or eq(false)
 		expect(location).to have_key(:sideOfStreet)
		expect(location[:sideOfStreet]).to be_a(String)
 		expect(location).to have_key(:linkId)
		expect(location[:linkId]).to be_a(String)
 		expect(location).to have_key(:unknownInput)
		expect(location[:unknownInput]).to be_a(String)
 		expect(location).to have_key(:type)
		expect(location[:type]).to be_a(String)
		expect(location).to have_key(:latLng)
		expect(location[:latLng]).to have_key(:lat)
		expect(location[:latLng][:lat]).to be_a(Float)
		expect(location[:latLng]).to have_key(:lng)
		expect(location[:latLng][:lng]).to be_a(Float)
		expect(location).to have_key(:displayLatLng)
		expect(location[:displayLatLng]).to have_key(:lat)
		expect(location[:displayLatLng][:lat]).to be_a(Float)
		expect(location[:displayLatLng]).to have_key(:lng)
		expect(location[:displayLatLng][:lng]).to be_a(Float)
 		expect(location).to have_key(:mapUrl)
		expect(location[:mapUrl]).to be_a(String)
	end
end