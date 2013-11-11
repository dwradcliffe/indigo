require 'spec_helper'

describe Indigo::Client do

  it "requires an host" do
    expect{ Indigo::Client.new }.to raise_error(ArgumentError)
  end

end
