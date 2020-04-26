class ChangeFollowableTypeToBeStringInFollows < ActiveRecord::Migration[6.0]
  def change
  	change_column :follows, :followable_type, :string
  end
end
