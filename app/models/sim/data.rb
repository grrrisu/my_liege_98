class Sim::Data < ActiveRecord::Base
  self.table_name = 'sim_data'
  has_many   :children, class_name: 'Sim::Data', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Sim::Data', foreign_key: 'parent_id', optional: true

  def self.properties *keys
    keys.each do |key|
      self.define_reader(key)
      self.define_writer(key)
    end
  end

  def self.define_reader(key)
    define_method(key) do
      properties.try(:[], key.to_s)
    end
  end

  def self.define_writer(key)
    define_method("#{key}=") do |text|
      self.properties ||= {}
      properties[key.to_s] = text
    end
  end

end
