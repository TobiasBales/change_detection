class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :change_detector, null: false, foreign_key: true
      t.text :result

      t.timestamps
    end
  end
end
