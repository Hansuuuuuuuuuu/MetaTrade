class CreateUserReports < ActiveRecord::Migration[5.0]
  def change
    create_table :user_reports do |t|
      t.string :reason
      t.integer :reporter
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
