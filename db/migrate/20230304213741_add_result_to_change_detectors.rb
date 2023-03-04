class AddResultToChangeDetectors < ActiveRecord::Migration[7.0]
  def change
    add_column :change_detectors, :result, :text, null: false, default: ''
  end
end
