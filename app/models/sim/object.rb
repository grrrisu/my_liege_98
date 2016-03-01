module Sim
  class Object < ActiveRecord::Base

    has_many   :children, class_name: 'Sim::Object', foreign_key: 'parent_id', dependent: :destroy
    belongs_to :parent, class_name: 'Sim::Object', foreign_key: 'parent_id', optional: true

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

    def sim
      true
    end

    def sim_children
      children.each do |child|
        child.sim_children
        child.sim
      end
    end

    def sim_workflow
      request
      produce
      transport
      consume
    end

    def request
      true
    end

    def produce
      true
    end

    def transport
      true
    end

    def consume
      true
    end

  end
end
