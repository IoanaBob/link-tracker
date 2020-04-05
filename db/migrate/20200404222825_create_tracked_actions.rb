# frozen_string_literal: true

class CreateTrackedActions < ActiveRecord::Migration[6.0]
  def change
    create_table :tracked_actions do |t|
      t.string :action
      t.references :tracking_link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
