class AddUserIdToChangeDetectors < ActiveRecord::Migration[7.0]
  def change
    add_column :change_detectors, :user_id, :bigint, null: false, foreign_key: true
  end
end
