class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :member
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
