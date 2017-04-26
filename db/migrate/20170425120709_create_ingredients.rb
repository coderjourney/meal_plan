class CreateIngredients < ActiveRecord::Migration[5.0]
  def up
    create_table :ingredients do |t|
      t.string :name

      t.timestamps
    end

    Ingredient.create(name: "Olives")
    Ingredient.create(name: "lettuce")
    Ingredient.create(name: "Thyme")
  end

  def down
    drop_table :ingredients
  end
end
