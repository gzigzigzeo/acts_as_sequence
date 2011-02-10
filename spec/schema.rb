ActiveRecord::Schema.define :version => 0 do
  create_table "sequences", :force => true do |t|
    t.integer :new_id1_item
    t.integer :id_2_sequence    
  end
end
