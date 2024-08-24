echo "creating mart"
psql postgresql://user:password@localhost:5432/db -a -f create_mart.sql

echo "reading mart"
psql postgresql://user:password@localhost:5432/db -a -f read_mart.sql | cat
