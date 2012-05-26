class AddCommentToWeeklyReports < ActiveRecord::Migration
  def change
    add_column :weekly_reports, :comment, :text

  end
end
