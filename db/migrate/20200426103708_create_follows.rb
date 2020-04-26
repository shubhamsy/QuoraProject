class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :followable_id
      t.integer :followable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
