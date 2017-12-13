require "spec_helper"

describe "Test to check through exchange rates format is the same" do

  before(:all) do
    @exchange = ParseJson.new("json_exchange_rates.json")
  end

  it "should be a hash" do
    expect(@exchange.json_file).to be_kind_of(Hash)

  end

  it "date should be date format" do
    expect(@exchange.get_date_value).to be_instance_of(String)
  end

  it "base should be euros" do
    expect(@exchange.get_base_value).to eq "EUR"
  end

  it "should contain 31 rates" do
    expect(@exchange.get_number_of_rates_value).to eq 31
  end

  it "all currency in rates is a float and above zero" do
    @exchange.get_rates_value.each do |key, value|
      expect(value).to be_instance_of(Float)
      expect(value).to be > 0
    end
  end

  it "all keys in rates is a string of 3 letters" do
    @exchange.get_rates_value.each do |key, value|
      expect(key).to be_instance_of(String)
      expect(key.length).to eq 3
    end
  end
end
