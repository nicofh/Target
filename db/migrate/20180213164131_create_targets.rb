class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.integer :length
      t.string :topic
      t.string :title

      t.timestamps
    end
  end
end
