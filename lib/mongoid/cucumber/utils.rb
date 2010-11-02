# encoding: utf-8
module Mongoid # :nodoc:
  module Cucumber #:nodoc:
    module Utils
      extend self

      # Determine the class of the model based on the name provided.
      #
      # @example Find the class for the model.
      #   Factory.model("person")
      #
      # @param [ String ] name The model name.
      #
      # @return [ Class ] The class for the model.
      def model(name)
        name.gsub(/\W+/, '_').classify.constantize
      end
    end
  end
end
