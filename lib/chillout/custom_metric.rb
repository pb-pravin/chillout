require 'chillout/creations_container'

module Chillout
  class CustomMetric
    def initialize(creations_container = nil)
      if creations_container.nil?
        Thread.current[:creations] ||= CreationsContainer.new
        @creations_container = Thread.current[:creations]
      else
        @creations_container = creations_container
      end
    end

    def track(name)
      creations_container.increment!(name)
    end
   
    private
    attr_reader :creations_container
  end
end