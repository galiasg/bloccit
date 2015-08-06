class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :belongs_to
      t.question :
      t.answers :has_many
      t.text :body

      t.timestamps null: false
    end
  end
end
