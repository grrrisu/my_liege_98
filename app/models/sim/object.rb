module Sim
  class Object < ActiveRecord::Base

    has_many   :children, class_name: 'Sim::Object', foreign_key: 'parent_id', dependent: :destroy
    belongs_to :parent, class_name: 'Sim::Object', foreign_key: 'parent_id', optional: true

    enum status: { idle: 0, pending: 1, scheduled: 2, performing: 3 }

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
end
