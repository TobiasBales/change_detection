class CreateChangeDetectors < ActiveRecord::Migration[7.0]
  def change
    create_table :change_detectors do |t|
      t.string :url

      t.timestamps
    end
  end
end
