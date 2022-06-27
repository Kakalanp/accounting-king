class CreateGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :icon
      t.datetime :createdAt

      t.timestamps
    end
  end
end
