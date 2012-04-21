class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.number :phone

      t.timestamps
    end
  end
end
