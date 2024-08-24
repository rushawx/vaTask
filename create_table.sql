create table if not exists events
(
    user_id varchar(255), 
    product_identifier varchar(255), 
    start_time timestamp without time zone, 
    end_time timestamp without time zone, 
    price_in_usd numeric
);