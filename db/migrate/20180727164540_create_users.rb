class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.references :trip, foreign_key: true
      t.references :trail, foreign_key: true
    end
  end
end
