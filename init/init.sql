create table if not exists deposits
(
    id integer,
    user_id integer, 
    amount numeric,
    created_at timestamp without time zone
);

create table if not exists withdrawls
(
    id integer,
    user_id integer, 
    amount numeric,
    created_at timestamp without time zone
);

insert into deposits values (0, 1, 100, '2024-08-23');
insert into deposits values (1, 1, 100, '2024-08-24');
insert into withdrawls values (2, 1, 50, '2024-08-24');
insert into deposits values (3, 2, 50, '2024-08-25');
insert into withdrawls values (4, 2, 100, '2024-08-25');
insert into withdrawls values (5, 2, 100, '2024-08-26');
