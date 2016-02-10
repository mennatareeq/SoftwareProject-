class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
