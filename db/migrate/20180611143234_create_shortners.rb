class CreateShortners < ActiveRecord::Migration[5.1]
  def change
    create_table :shortners do |t|

      t.integer :user_id
      t.string :original_url
      t.string :short_url

      t.timestamps
    end
  end
end
