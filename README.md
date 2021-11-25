Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

```
create procedure delete_delta_data LANGUAGE SQL AS $$ delete from delta_load_master_control; delete from delta_load_job_control; $$;
```

create table delta_load_master_control(sequence_id int, batch_name varchar(20), status varchar(20), started_time timestamp, completed_time timestamp, retry_amount int, retry_delay_in_minutes int, cdc_start_datetime timestamp, cdc_end_datetime timestamp, batch_period_in_minutes int);

create table delta_load_job_control(batch_seq_id int, job_table_name varchar(20), job_table_status varchar(20), no_load_attempts int, table_load_start_time timestamp, table_load_end_date timestamp);

create table delta_load_global_settings(batch_name varchar(20), retry_count int, retry_delay_in_minutes int, batch_period_in_minutes int, batch_load_type char(1), default_source_system varchar(20), initial_load_start_date timestamp, initial_load_end_date timestamp);

create table orders (id int, status varchar(20), updated_at timestamp without time zone); 


psql -U postgres

docker exec -it 242f04c2f039 bash