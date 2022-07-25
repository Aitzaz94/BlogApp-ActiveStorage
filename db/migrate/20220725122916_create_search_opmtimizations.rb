class CreateSearchOpmtimizations < ActiveRecord::Migration[7.0]
  def change
    create_table :search_opmtimizations do |t|
      t.string :keyword
      t.string :city
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
