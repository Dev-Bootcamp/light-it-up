class FixErrorAndAddColor < ActiveRecord::Migration
  def change
    change_table :elements do |t|
      t.remove :background_color
    end

    change_table :slides do |t|
      t.string :background_color
      t.string :color
    end
  end
end
