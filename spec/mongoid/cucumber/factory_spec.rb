require "spec_helper"

describe Mongoid::Cucumber::Factory do

  before do
    Person.delete_all
  end

  let(:klass) do
    Mongoid::Cucumber::Factory
  end

  describe ".create" do

    context "when provided a table with one row" do

      let(:table) do
        Cucumber::Ast::Table.new([
          %w{title dob},
          %w{Sir 1976/10/31}
        ])
      end

      let(:document) do
        klass.create("person", table)
      end

      it "returns a single document" do
        document.should be_a(Person)
      end

      it "sets strings" do
        document.title.should == "Sir"
      end

      it "sets dates" do
        document.dob.should == Date.new(1976, 10, 31)
      end

      it "returns a persisted document" do
        document.should be_persisted
      end
    end
  end

  describe ".create_all" do

    context "when provided a table with multiple rows" do

      let(:table) do
        Cucumber::Ast::Table.new([
          %w{title dob},
          %w{Sir 1976/10/31},
          %w{Madam 1975/11/30}
        ])
      end

      let(:documents) do
        klass.create_all("person", table)
      end

      it "returns an array" do
        documents.should be_a(Array)
      end

      it "returns documents in the array" do
        documents.each { |doc| doc.should be_a(Person) }
      end

      it "sets strings" do
        documents.first.title.should == "Sir"
      end

      it "sets dates" do
        documents.first.dob.should == Date.new(1976, 10, 31)
      end

      it "returns a persisted document" do
        documents.first.should be_persisted
      end
    end
  end

  describe ".instantiate" do

    context "when provided a table with one row" do

      let(:table) do
        Cucumber::Ast::Table.new([
          %w{title dob},
          %w{Sir 1976/10/31}
        ])
      end

      let(:document) do
        klass.instantiate("person", table)
      end

      it "returns a single document" do
        document.should be_a(Person)
      end

      it "sets strings" do
        document.title.should == "Sir"
      end

      it "sets dates" do
        document.dob.should == Date.new(1976, 10, 31)
      end

      it "returns a new document" do
        document.should_not be_persisted
      end
    end
  end
end
