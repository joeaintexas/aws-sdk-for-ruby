# Copyright 2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'spec_helper'

module AWS
  class EC2
    describe ReservedInstancesCollection do

      it_should_behave_like "an ec2 model object", {}

      it_should_behave_like "ec2 collection object" do

        let(:member_class) { ReservedInstances }

        let(:client_method) { :describe_reserved_instances }

        def stub_two_members(resp)
          resp.stub(:reserved_instances_set).
            and_return([
              double("reserved-1",
                :reserved_instances_id => "id-1"),
              double("reserved-2",
                :reserved_instances_id => "id-2"),
            ])
        end

        it_should_behave_like "a tagged ec2 collection"

        it_should_behave_like "ec2 collection array access"

      end
    end
  end
end
