class AddAccountId < ActiveRecord::Migration
  def up
  	add_column :summoners, :account_id, :string
  end

  def down
  	remove_column :summoners, :account_id, :string
  end
end
