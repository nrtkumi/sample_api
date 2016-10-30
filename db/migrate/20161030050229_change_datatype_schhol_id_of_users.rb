class ChangeDatatypeSchholIdOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :school_id, :integer
  end
end
