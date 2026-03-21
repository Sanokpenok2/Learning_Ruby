require "rspec"
require "C:/Users/totts/RubymineProjects/test/lesson6/lesson6_1.rb"

RSpec.describe User do
  describe "#print_name" do
    subject { User.new.print_name(name) }

    context "When name is John" do
      let(:name) { "John" }

      it "returns greetings to John" do
        expect{subject}.to output("Hello, John!\n").to_stdout
      end
    end

    context "When name is Marry" do
      let(:name) { "Marry" }

      it "returns greetings to Marry" do
        expect{subject}.to output("Hello, Marry!\n").to_stdout
      end
    end

    context "When name is 'Ivan'" do
      let(:name) { "Ivan" }

      it "return question who is the user" do
        expect{subject}.to output("Who are you?\n").to_stdout
      end
    end
  end

  describe ".divide" do
    subject { User.new.send(:divide, a, b) }

    context "When everything is fine" do
      let(:a) { 25 }
      let(:b) { 5 }

      it "Goddamn right" do
        expect(subject).to eq 5
      end
    end

    context "When b is 0" do
      let(:a) { 25 }
      let(:b) { 0 }

      it "returns error" do
        expect { subject }.to raise_error(ZeroDivisionError)
      end
    end

  end
end