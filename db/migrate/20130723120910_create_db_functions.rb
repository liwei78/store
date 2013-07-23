class CreateDbFunctions < ActiveRecord::Migration
  def up
    create_table :users_log do |t|
      t.integer  :user_id
      t.string   :content
      t.timestamps
    end

    
    execute "
      CREATE OR REPLACE FUNCTION log_store_change_update_user()
        RETURNS trigger AS
      ' BEGIN insert into users_log(user_id,content,created_at,updated_at) values(1, \"fuccck\", Now(),Now()); return NULL; END; '
        LANGUAGE plpgsql VOLATILE
        COST 100;
      ALTER FUNCTION log_store_change_update_user()
        OWNER TO liwei;
    "

    execute "
      CREATE TRIGGER store_users_create_logger
      AFTER INSERT OR DELETE
      ON users
      FOR EACH ROW
      EXECUTE PROCEDURE log_store_change_update_user();
    "

  end

  def down
    drop_table :users_log
  end
end
