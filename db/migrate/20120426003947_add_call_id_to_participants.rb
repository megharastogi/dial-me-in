class AddCallIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :call_id, :integer
  end
end
