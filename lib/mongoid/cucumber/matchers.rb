# encoding: utf-8
require "mongoid/cucumber/matchers/existence"

module Mongoid # :nodoc:
  module Cucumber #:nodoc:
    module Matchers
      extend self

      # Determines if a document or documents with the given attributes in a
      # table exist.
      #
      # @example Create a document using the factory
      #   Matchers.exists?("person", table)
      #
      # @param [ String ] model The name of the model
      # @param [ Table ] table The table to generate from.
      #
      # @return [ TrueClass, FalseClass ] do the all the documents exist?
      def exists?(name, table)
        Existence.new(name, table).matches?
      end
    end
  end
end
