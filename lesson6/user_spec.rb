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

  describe ".say_my_name" do
    subject { User.new.send(:say_my_name) }

    before { allow_any_instance_of(Kernel).to receive(:gets).and_return(name) }

    context "When name is 'Heisenberg'" do
      let(:name) { "Heisenberg" }

      it "Goddamn right" do
        expect{subject}.to eq "You're goddamn right"
      end
    end

  end
end