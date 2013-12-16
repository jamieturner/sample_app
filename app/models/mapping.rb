class Mapping < ActiveRecord::Base
self.inheritance_column = nil

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Mapping.create! row.to_hash
    end
  end
  
end