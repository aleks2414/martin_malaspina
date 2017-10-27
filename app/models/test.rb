class Test < ActiveRecord::Base

  extend FriendlyId
  friendly_id :nombre, use: :slugged  

  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |test|
        csv << test.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: "ISO8859-1:utf-8") do |row|
      test_hash = row.to_hash
      test = find_or_create_by!(nombre: test_hash['nombre'], colegio: test_hash['colegio'])
      test.update_attributes(test_hash)
    end
  end


end
