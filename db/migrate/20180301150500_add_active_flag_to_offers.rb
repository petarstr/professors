class AddActiveFlagToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :active, :boolean, null: false, default: true
  end
end
