require File.join(File.dirname(__FILE__), "../spec_helper")

describe "Query search host information" do
  subject { ForemanDB::Search }
  it "returns host" do
    VCR.use_cassette('search') do
      search = ForemanDB::Search.search("params.custom_parameter_2 = test")
      search.results.should_not be_empty
      search.results.first.attributes["ip"].should be_kind_of(String)
      search.results.first.attributes["ip"].should_not be_empty
    end
  end
end
