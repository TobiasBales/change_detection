class AddDiscardRegexpToChangeDetector < ActiveRecord::Migration[7.0]
  def change
    add_column :change_detectors, :discard_regexps, :string, array: true, null: false, default: []
  end
end
