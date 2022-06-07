class CreateActivityLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_logs do |t|
      t.references :category, null: false, foreign_key: true
      t.datetime :hours
      t.timestamps
    end
  end
end
