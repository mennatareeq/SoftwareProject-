class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.string :path
      t.integer :pdf_id
      t.timestamps null: false
    end
  end

  def down
    drop_table :images
  end
end
