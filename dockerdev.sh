if [ -n "$1" ]; then
  echo "You are now removing the $1 container"
else
  echo "You should specify at least one parameter (run, pull, remove, dropdatabase)"
  exit
fi

#run container e run all
#pull without additional parameters
#dropdatabase database e dropdatabase all
#remove contaienr e remove all



#read -p "Enter marks: " marks
#if [ $marks -ge 80 ]
#then
#  echo "Excellent"
#elif [ $marks -ge 60 ]
#then
#  echo "Good"
#else
#  echo "Satisfactory"
#fi

#sudo docker pull mariadb
#sudo docker pull phpmyadmin
#sudo docker pull wordpress


username=$USER

sleep 1
sudo docker container stop $1
sleep 1
sudo docker container rm $1
sleep 1
sudo rm /home/$username/wordpress/$1 -rf
sleep 1
sudo docker exec -i wordpressdb mysql -uroot -proot-password  <<< "drop database IF EXISTS $1;"




