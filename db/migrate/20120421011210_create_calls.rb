class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.datetime :time

      t.timestamps
    end
  end
end
