class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user, index: true
      t.string :title
      t.date :due_date

      t.timestamps
    end
  end
end
