require File.join(File.dirname(__FILE__), "../spec_helper")

describe "Query host information" do
  subject { ForemanDB::Host }
  it "returns host" do
    VCR.use_cassette('host') do
      host = ForemanDB::Host.find_by_id(4)
      host["ip"].should eq("1.2.3.4")
    end
  end
end
