start=200001
end=300000
# Loop through the number of inserts
for i in $(seq $start $end);
do
echo $i
docker exec -ti mysql mysql -ppass -Dhw -e"INSERT INTO users (id, name, email, age) VALUES ($i, 'Im just Ken, where I see love she sees a friend', 'kenough@ken.com', 30);"

done
