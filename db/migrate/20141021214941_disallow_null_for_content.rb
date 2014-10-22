class DisallowNullForContent < ActiveRecord::Migration
  def change
    change_column :shouts, :content_type, :string, null: false
    change_column :shouts, :content_id, :string, null: false
  end
end
