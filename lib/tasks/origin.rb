#!/bin/env ruby

target = "aconfigfile.rb"
ENV['RAILS_ENV'] = "development"
require '../../config/environment.rb'
contents = ""
contents.concat("  SUBSCRIPTION_MAP = {").concat($/)
Mapping.all.each do |mapping|
  if  mapping.temp.to_s == "Temp"
    contents.concat("\"" + mapping.mapping_id + "\"" + "=> {registration_fee: " + mapping.registration_fee.to_s + ", subscriptions: [").concat($/)
    arrayvar = mapping.maps_from_temp_ids.to_s.split(',')
    arrayvar.each do |i|
      bob = Mapping.find_by mapping_id: i
      if i != arrayvar.last
        comma = ","
      else
        comma = ""
      end
      contents.concat("{subscription_type_id: " + "\"" + i + "\"" + ", subscription_duration_type: " + "\"" + bob.duration.to_s + "\"" + ", subscription_type: " + "\"" + bob.type.to_s + "\"" + ", total_price: " + bob.total + ", currency: " + "\"" + bob.currency.to_s + "\"}" + comma).concat($/)
    end
    contents.concat("]},").concat($/)
  end
end
contents.concat("}").concat($/)
File.open(target, "w").write(contents)