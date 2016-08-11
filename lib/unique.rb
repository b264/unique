# coding: utf-8
# frozen_string_literal: true
module ::Unique
  DEFAULT_MAX_TRIES= 4096
  NoUniqueValues= Class.new(StandardError)
  NoArgumentsAllowed= Class.new(StandardError)
  @@instances= Array.new
  class<< self
    def max_tries= num
      def self.max_tries
        @max_tries
      end
      @max_tries= num
    end
  end
  self.max_tries= DEFAULT_MAX_TRIES
  def self.next! *args, &block
    raise NoArgumentsAllowed, 'Only a block is accepted.' unless args.empty? && block.kind_of?(Proc)
    tries= 0
    loop {
      tries+= 1
      raise NoUniqueValues, "An unused, unique object could not be found (#{block.source_location.inspect})" if tries> max_tries
      unless @@instances.include?(instance= yield)
        @@instances.unshift instance
        break instance
      end
    }
  end
end
require_relative 'unique/version'
