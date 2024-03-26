class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      # 他のカラムも追加する場合はここに記述
      t.timestamps
    end
  end
end