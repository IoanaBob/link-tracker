class CreateTrackingLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracking_links do |t|
      t.string :message_id
      t.string :recipient_email
      t.string :subject
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
