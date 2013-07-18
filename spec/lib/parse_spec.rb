require File.join(File.dirname(__FILE__), "../spec_helper")

describe ForemanDB::Parser do
  let(:raw_search_response) do
    "[{\"host\":{\"operatingsystem_id\":1,\"hostgroup_id\":1,\"id\":1,\"name\":\"node001.local\"}},{\"host\":{\"operatingsystem_id\":1,\"hostgroup_id\":2,\"id\":2,\"name\":\"node002.local\"}},{\"host\":{\"operatingsystem_id\":2,\"hostgroup_id\":2,\"id\":3,\"name\":\"node003.local\"}}]"
  end

  let(:raw_host_response) do
    "{\"host\":{\"image_file\":\"\",\"owner_id\":1,\"ptable_id\":1,\"location_id\":null,\"serial\":null,\"model_id\":null,\"operatingsystem_id\":1,\"puppet_status\":0,\"interfaces\":[],\"created_at\":\"2013-01-01T10:10:16Z\",\"disk\":\"\",\"image_id\":2,\"medium_id\":3,\"compute_resource_id\":2,\"domain_id\":8,\"hostgroup_id\":7,\"puppet_proxy_id\":1,\"updated_at\":\"2013-01-01T10:54:51Z\",\"last_compile\":null,\"root_pass\":\"pass\",\"subnet_id\":null,\"enabled\":true,\"environment\":{\"environment\":{\"id\":8,\"name\":\"test\"}},\"id\":1,\"ip\":\"123.123.123.123\",\"managed\":true,\"organization_id\":null,\"use_image\":null,\"environment_id\":1,\"last_freshcheck\":null,\"name\":\"node001.local\",\"build\":false,\"comment\":\"\",\"last_report\":null,\"source_file_id\":null,\"uuid\":\"i-abcdef\",\"architecture_id\":1,\"installed_at\":\"2013-01-01T10:54:51Z\",\"mac\":null,\"host_parameters\":[{\"host_parameter\":{\"priority\":1,\"reference_id\":1,\"created_at\":\"2013-01-01T10:50:16Z\",\"updated_at\":\"2013-01-01T12:50:16Z\",\"value\":\"node\",\"id\":10,\"name\":\"custom_parameter_1\"}},{\"host_parameter\":{\"priority\":1,\"reference_id\":1,\"created_at\":\"2013-01-01T12:50:16Z\",\"updated_at\":\"2013-01-01T12:50:16Z\",\"value\":\"test\",\"id\":10,\"name\":\"custom_parameter_2\"}}],\"certname\":\"node001.local\",\"owner_type\":\"User\",\"puppet_ca_proxy_id\":1}}"
  end

  describe "#parse" do
    context "with search response" do
      it "returns array with elemnts with ids" do
        subject.parse(raw_search_response).each do |parsed_node|
          parsed_node["id"].should be_kind_of(Integer)
        end
      end
    end

    context "with host response" do
      it "returns string" do
        subject.parse(raw_host_response)["ip"].should eq("123.123.123.123")
      end
    end

  end
end
