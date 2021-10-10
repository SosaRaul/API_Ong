require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject {
    described_class.new(name: "Anything",
                        phone: 1000,
                        email: "hola@hola.com",
                        message: "Lorem ipsum",
                        )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end


  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a message" do
    subject.message = nil
    expect(subject).to_not be_valid
  end
end