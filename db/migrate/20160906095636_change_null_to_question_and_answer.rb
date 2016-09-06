class ChangeNullToQuestionAndAnswer < ActiveRecord::Migration[5.0]
  def change
    change_column_null :questions, :title, false
    change_column_null :questions, :content, false

    change_column_null :answers, :spot_detail, false
  end
end
