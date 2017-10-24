class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :nombre
      t.string :colegio
      t.string :nivel
      t.string :seccion
      t.float :edad
      t.float :ic
      t.float :icm
      t.float :pi_num
      t.float :pi_comp
      t.float :pi_cal
      t.float :pi_conc
      t.float :pf_conv
      t.float :pf_hecho
      t.float :pf_calc
      t.float :pf_conce

      t.timestamps null: false
    end
  end
end
