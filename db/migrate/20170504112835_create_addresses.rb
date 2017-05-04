class CreateAddresses < MigrationConnection
  def self.up
    
    with_proper_connection do
      create_table :addresses do |t|
        t.string :full_name
        t.string :city
        t.string :street
        t.string :flat_no
        t.string :phone
        t.integer :user_id

        t.timestamps
      end

      add_index :addresses, :user_id,                unique: true
    end

  end

  def self.down
    with_proper_connection do
      drop_table :addresses
    end
  end
end
