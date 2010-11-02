# encoding: utf-8
module Mongoid # :nodoc:
  module Cucumber #:nodoc:
    module Factory
      extend self

      # Create a new persisted document based on the model name and given the
      # supplied attributes in a table.
      #
      # @example Create a document using the factory
      #   Factory.create("person", table)
      #
      # @param [ String ] model The name of the model
      # @param [ Table ] table The table to generate from.
      #
      # @return [ Document ] A newly persisted document.
      def create(name, table)
        Utils.model(name).new(table.hashes.first).tap do |document|
          document.save
        end
      end

      # Create a new document based on the model name and given the supplied
      # attributes in a table.
      #
      # @example Instantiate a new document.
      #   Factory.create("person", table)
      #
      # @param [ String ] model The name of the model
      # @param [ Table ] table The table to generate from
      #
      # @return [ Document ] A new document.
      def instantiate(name, table)
        Utils.model(name).new(table.hashes.first)
      end
    end
  end
end
