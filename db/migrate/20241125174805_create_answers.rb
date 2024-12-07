class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.string :name
      t.integer :votes
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
