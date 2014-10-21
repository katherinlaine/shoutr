class CreateFollowRelationships < ActiveRecord::Migration
  def change
    create_table :follow_relationships do |t|
      t.belongs_to :follower, index: true
      t.belongs_to :followee, index: true

      t.timestamps
    end
  end
end
