class CreateTagsPosts < ActiveRecord::Migration
  def change
    create_table :tags_posts do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
