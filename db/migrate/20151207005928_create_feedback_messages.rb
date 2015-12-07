class CreateFeedbackMessages < ActiveRecord::Migration
  def change
    create_table :feedback_messages do |t|
      t.text :body
      t.string :sender
      t.belongs_to :lesson, index: true

      t.timestamps null: false
    end
  end
end
