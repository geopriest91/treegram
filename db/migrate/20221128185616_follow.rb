class Follow < ActiveRecord::Migration
  def change
    create_table :follow do |t|
      t.column :follower_id, :int
      t.column :followee_id, :int
    end
  end
end
