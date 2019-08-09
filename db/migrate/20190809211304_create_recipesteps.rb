class CreateRecipesteps < ActiveRecord::Migration[5.2]
  def change
    create_table :recipesteps do |t|
      t.string :title
      t.string :description
      t.string :order
      t.references :recipe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
