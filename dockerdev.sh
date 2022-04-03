if [ -n "$1" ]; then
  echo "You are now removing the $1container"
else
  echo "The container name is not supplied."
  exit
fi

username=$USER

sleep 1
sudo docker container stop $1
sleep 1
sudo docker container rm $1
sleep 1
sudo rm /home/$username/wordpress/$1 -rf
sleep 1
sudo docker exec -i wordpressdb mysql -uroot -proot-password  <<< "drop database IF EXISTS $1;"
