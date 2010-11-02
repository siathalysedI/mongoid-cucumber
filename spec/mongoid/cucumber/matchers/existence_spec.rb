require "spec_helper"

describe Mongoid::Cucumber::Matchers::Existence do

  before do
    Person.delete_all
  end

  let(:klass) do
    Mongoid::Cucumber::Matchers::Existence
  end

  describe "#initialize" do

    let(:matcher) do
      klass.new("person", nil)
    end

    it "inflects the model class" do
      matcher.model.should == Person
    end
  end

  describe "#matches?" do

    before do
      Person.create(:title => "Sir", :dob => "1976/10/31")
    end

    context "when the document matches" do

      let(:table) do
        Cucumber::Ast::Table.new([
          %w{title dob},
          %w{Sir 1976/10/31}
        ])
      end

      let(:matcher) do
        klass.new("person", table)
      end

      it "returns true" do
        matcher.matches?.should == true
      end
    end

    context "when the document does not match" do

      let(:table) do
        Cucumber::Ast::Table.new([
          %w{title dob},
          %w{Sir 1976/08/20}
        ])
      end

      let(:matcher) do
        klass.new("person", table)
      end

      it "returns false" do
        matcher.matches?.should == false
      end
    end
  end
end
