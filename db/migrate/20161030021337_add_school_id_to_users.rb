class AddSchoolIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :school_id, :string
  end
end
