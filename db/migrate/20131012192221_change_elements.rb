class ChangeElements < ActiveRecord::Migration
  def change
    change_table :elements do |t|
      t.remove :size
      t.remove :coordinates
      t.string :width
      t.string :heigth
      t.string :top
      t.string :left
    end
  end
end
