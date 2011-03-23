require 'spec_helper'

describe "Geometry saver plugin" do
  before(:each) do
    if Sequence.first
      Sequence.first.update_attributes({
        :new_id1_item => 1,
        :id_2_sequence => 10
      })
    end
  end
  
  context "sequencer" do
    it "gets next values for a sequences" do
      Sequence.next_sequence_value(:new_id1_item).should == 1
      Sequence.next_sequence_value(:id_2_sequence).should == 10
    end
  end
  
  context "sequences" do
    it "sets values for next sequences on initialize record" do
      n = Item.new
      n.new_id1.should == 1
      n.new_id2.should == 10
    end
  end
end