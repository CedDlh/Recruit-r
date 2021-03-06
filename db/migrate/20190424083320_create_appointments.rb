class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.references :applicant, foreign_key: true
      t.references :recruiter, foreign_key: true

      t.timestamps
    end
  end
end
