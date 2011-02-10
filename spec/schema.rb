ActiveRecord::Schema.define :version => 0 do
  create_table "sequences", :force => true do |t|
    t.integer :new_id1_item, :default => 1
    t.integer :id_2_sequence, :default => 10
  end
  
  create_table "items" do |t|
    t.integer :new_id1
    t.integer :new_id2
  end
end
