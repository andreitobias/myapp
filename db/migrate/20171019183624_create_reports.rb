class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :contact_id, references: nil
      t.string :impression
      t.string :mobile
      t.integer :speed
     
      t.timestamps
    end
  end
end
