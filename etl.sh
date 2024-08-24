echo "creating database"
psql postgresql://user:password@localhost:5432/db -a -f create_database.sql

echo "creating table"
psql postgresql://user:password@localhost:5432/db -a -f create_table.sql

echo "extracting data"
curl "https://drive.usercontent.google.com/download?id=1dHnYmn4mO2rsJxa_7RYK9thp70smeFcf&confirm=xxx" -o data.csv -k

echo "loading data"
echo "\COPY events FROM 'data.csv' DELIMITERS ',' CSV HEADER;" | psql postgresql://user:password@localhost:5432/db -a
