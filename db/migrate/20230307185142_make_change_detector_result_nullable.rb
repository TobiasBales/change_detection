class MakeChangeDetectorResultNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :change_detectors, :result, true
  end
end
