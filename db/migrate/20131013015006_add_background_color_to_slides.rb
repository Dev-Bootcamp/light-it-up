class AddBackgroundColorToSlides < ActiveRecord::Migration
  def change
    change_table :elements do |t|
      t.string :background_color
    end
  end
end
