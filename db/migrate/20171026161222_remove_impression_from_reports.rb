class RemoveImpressionFromReports < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :impression, :string
  end
end
