class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.text :gene
      t.decimal :earnings
      t.integer :generation

      t.timestamps
    end
  end
end
