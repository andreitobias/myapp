class AddAnswersToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :what, :string
    add_column :reports, :who, :string
    add_column :reports, :wiifm, :string
  end
end
