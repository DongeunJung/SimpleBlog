class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
		t.integer :member_id
		
		t.string :gender
		t.string :phone
		t.text :address
		
		t.timestamps
    end
  end
end
