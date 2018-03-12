class AddWhattodoToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :whattodo, :string
  end
end
