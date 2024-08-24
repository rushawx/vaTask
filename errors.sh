echo "creating input table"
psql postgresql://user:password@localhost:5432/db -a -f create_input_table.sql

echo "loading data"
echo "\COPY input FROM 'stations.csv' DELIMITERS ';' CSV HEADER;" | psql postgresql://user:password@localhost:5432/db -a

echo "creating errors table"
psql postgresql://user:password@localhost:5432/db -a -f create_errors_table.sql
