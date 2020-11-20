class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
		t.integer :member_id
		t.string :member_name
		t.string :title
		t.string :body
		
		t.timestamps
    end
  end
end
