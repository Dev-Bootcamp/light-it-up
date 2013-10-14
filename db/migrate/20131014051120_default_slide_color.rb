class DefaultSlideColor < ActiveRecord::Migration
  def change
    change_column(:slides, :background_color, :string, default: "rgb(210,210,210)")
  end
end
