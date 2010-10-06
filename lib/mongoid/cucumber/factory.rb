# encoding: utf-8
module Mongoid # :nodoc:
  module Cucumber #:nodoc:
    module Factory
      extend self

      # Create a new persisted document based on the model name and given the
      # supplied attributes in a table.
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
        model(name).new(table.hashes.first).tap do |document|
          document.save
        end
      end

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
      def instantiate(name, table)
        model(name).new(table.hashes.first)
      end

      private

      # Determine the class of the model based on the name provided.
      #
      # Example:
      #
      # <tt>Factory.model("person")</tt>
      #
      # Params:
      #
      # name: String for the model name.
      #
      # Returns:
      #
      # The class for the model.
      def model(name)
        name.gsub(/\W+/, '_').classify.constantize
      end
    end
  end
end
