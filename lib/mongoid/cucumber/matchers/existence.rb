# encoding: utf-8
module Mongoid # :nodoc:
  module Cucumber #:nodoc:
    module Matchers
      class Existence

        attr_reader :model, :table

        # Determines if a document or documents with the given attributes in a
        # table exist.
        #
        # @example Create a document using the factory
        #   Existence.new("person", table)
        #
        # @param [ String ] model The name of the model
        # @param [ Table ] table The table to generate from.
        #
        # @return [ Existence ] The existence matcher.
        def initialize(name, table)
          @model, @table = Utils.model(name), table
        end

        # Determines if a document or documents with the given attributes in a
        # table exist.
        #
        # @example Create a document using the factory
        #   existence.matches?
        #
        # @return [ TrueClass, FalseClass ] do the all the documents exist?
        def matches?
          model.where(table.hashes.first).exists?
        end
      end
    end
  end
end
