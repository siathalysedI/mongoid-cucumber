# encoding: utf-8
module Mongoid # :nodoc:
  module Cucumber #:nodoc:
    module Factory
      extend self

      # Create a new document based on the model name and given the supplied
      # attributes in a table.
      #
      # Example:
      #
      # <tt>Factory.create("person", table)</tt>
      #
      # Params:
      #
      # model: The name of the model
      # table: A +Cucumber::Ast::Table+
      #
      # Returns:
      #
      # A newly persisted document.
      def create(name, table)
        model(name).new(table.hashes.first)
      end

      private

      def model(name)
        name.gsub(/\W+/, '_').classify.constantize
      end
    end
  end
end
