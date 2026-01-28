exit
sudo apt-get update
exit
sudo ~/.ssh/authorized_keys
sudo vim ~/.ssh/authorized_keys
ls ~/.ssh
cat ~/.ssh/authorized_keys
vim ~/.ssh/authorized_keys
ls ~/.ssh
mkdir ~/.ssh
ls ~/.ssh
pwd
vim ~/.ssh/authorized_keys
ls ~/.ssh
exit
sudo vim/etc/sudoers.d/mina-user
sudo vim /etc/sudoers.d/mina-user
sudo apt-get update
docker ps
sudo apt install docker.io
sudo usermod -aG docker mina
docker ps
exit
docker ps
docker ps -a
docker rm my-nginx-2
docker ps -a
docker rm my-nginx
docker rm flamboyant_hawking
docker ps -a
exit
ped
pwd
ls
docker ps -a
scp -r "C:\Users\asimi\Documents\Data_Engineering_Bootcamp\docker" mina@157.180.67.45:~/
pwd
ls
cd docker
ls -l
rm *:Zone.Identifier
ls -l
vim Dockerfile
ls -l
cd ..
cd docker
docker build -t img_webscraper
docker build -t img_webscraper .
vim Dockerfile 
rm Dockerfile
ls -l
vim Dockerfile
ls -l
docker build -t img_webscraper .
vim Dockerfile
docker images
docker rm $(docker images)
docker images
docker rm 1d76fe608e1c
docker rmi $(docker images)
docker images
ls -l
docker build -t img_webscraper .
docker images
docker run --name webscraper_1 img_webscraper
vim Dockerfile
docker rm img_webscraper
docker rmi img_webscraper
docker rm webscraper_1
docker rmi img_webscraper
docker images
docker build -t my_image .
docker run -d --name webscraper my_image
ls -l
docker ps
docker ps -a
docker cp webscraper:/app/csv/atp-rankings.csv ./atp-rankings.csv
ls -l atp-rankings.csv
head atp-rankings.csv
ls -l ~/docker
scp mina@157.180.67.45:~/docker/atp-rankings.csv ~/docker/
ls -l
vim Dockerfile
docker build -t my_image_cron .
docker images
docker run -d --name webscraper_cron   -v ~/docker/csv:/app/csv   my_image_cron
ls -l ~/docker/csv
tail -f ~/docker/csv/cron.log
docker ps
docker rm webscraper_cron
docker stop webscraper_cron
docker rm webscraper_cron
docker ps -a
docker rmi my_image_2
docker rmi my_image_cron
docker images
vim Dockerfile
docker build -t my_image_cron .
docker run -d --name webscraper_cron -v ~/docker/csv:/app/csv my_image_cron
tail -f ~/docker/csv/cron.log
docker ps
docker stop webscraper_cron
docker run -it --rm my_image_cron which python3
docker rm webscraper_cron
docker rmi my_image_cron -q
docker rmi my_image_cron
vim Dockerfile
docker build -t my_image_cron .
docker run -d --name webscraper_cron -v ~/docker/csv:/app/csv my_image_cron
tail -f ~/docker/csv/cron.log
docker stop webscraping_cron
docker stop webscraper_cron
docker ps
docker ps -a
ls -l
docker volume ls
docker volume inspect
vim Dockerfile
cd ..
ls
cd docker
docker ps
docker ps -a
docker rm webscraper_cron
docker run -d --name webscraper_cron -v scrape_vol:/app/csv \ my_image_cron
docker run -d --name test1 \ -v my_volume:/app/csv \ my_image_cron
docker run -d --name test1 -v my_volume:/app/csv my_image_cron
tail -f ~/docker/csv/cron.log
docker ps
docker exec -it test1 bash
ls -l
docker ps
docker stop webscraper_cron
docker ps
docker ps -a
docker stop test1
vim Dockerfile
exit
pwd
ls
cd docker_II
ls
docker compose up
sudo apt install docker-compose
docker compose up
docker-compose up
vim docker-compose.yml
docker-compose config
vim docker-compose.yml
docker-compose config
vim docker-compose.yml
docker-compose config
docker-compose up
docker ps
docker ps -a
docker rm $(docker ps -a -q)
docker ps -a
docker-compose up -d
docker inspect
docker ps
docker inspect postgres-db
telnet postgres-db 8080
docker exec -ti postgres-db bash
docker ps
ip a
vim docker-compose.yml
docker exec -it my_webscraper bash
docker ps
docker-compose down
vim docker-compose.yml
vim webscraper-postgres.py
docker-compose up -d
docker ps
docker-compose down
exit
ls
cd docker_II
ls
vim docker-compose.yml
docker-compose up -d
ip a
docker ps
docker exec my_webscraper
docker exec -ti my_webscraper bash
vim Dockerfile
docker exec -ti my_webscraper bash
docker-compose down
vim docker-compose.yml
ls
vim webscraper-postgres.py
docker-compose up 
vim docker-compose.yml
exit
ls
docker rm docker_II
rm docker_II
rm -rf docker_II
docker ps
docker ps -a
docker rm $(docker ps -a -q)
docker ps -a
rm docker_II
sudo rm docker_II
sudo rm -rf docker_II
ls
docker-compose up -d
cd docker_II
docker-compose up -d
docker-compose down
docker-compose up --build -d
ls
vim csv
cd csv
ls
cd ..
sudo rm -rf csv
ls
docker-compose up --build -d
docker ps
docker volumes
docker volume ls
docker-compose down
docker rm $(docker ps -a -q)
docker ps -a
docker rmi $(docker images -q)
docker images ls
docker image ls
docker volume ls
docker volume prune --filter all=1
y
docker volume ls
ls
docker-compose up -d
docker ps
vim docker-compose.yml
vim webscraper-postgres.py
vim Dockerfile
vim docker-compose.yml
docker ps
docker ps -a
docker volume ls
docker image ls
docker-compose --build -d
docker-compose up --build -d
vim Dockerfile
docker-compose up --build -d
docker ps 
vim docker-compose.yml
vim webscraper-postgres.py
docker ps
vim docker-compose.yml
docker exec -ti my_webscraper bash
vim Dockerfile
docker-compose down
docker-compose up --build -d
docker ps
docker exec -ti my_webscraper bash
docker-compose down
vim webscraper-postgres.py
docker-compose up --build -d
docker exec -ti my_webscraper bash
docker-compose down
vim webscraper-postgres.py
docker-compose up --build -d
vim docker-compose.yml
cd ..
cd docker
ls
docker ps
cd ..
cd docker_II
vim docker-compose.yml
vim Dockerfile
vim webscraper-postgres.py
docker-compose down
exit
ls
sudo vim /etc/gitlab-runner/config.toml
ls
rm -r  docker-ci-cd-asiminaaggelidi/
rm -rf docker-ci-cd-asiminaaggelidi
ls
cd docker-ci-cd-exercise/
ls
vim docker-compose.yaml
εχιτ
exit
ssh-keygen -t ed25519 ~/.ssh/gitlab_ci_key -C "gitlab-ci"
ssh-keygen -t ed25519 -f ~/.ssh/gitlab-ci-key -C "gitlab-ci"
ls
pwd
ls -la
ls ~/.ssh
cd authorized_keys
vim authorized_keys
ls
ls ~/.ssh/authorized_keys
cd .ssh
ls
vim authorized_keys
vim gitlab-ci-key.pub
vim authorized_keys
vim gitlab-ci-key
cd ..
ls
cd docker-ci-cd-exercise/
ls
docker-compose.yaml up -d
docker-compose up -d
docker ps
docker network
ls network
ls
docker inspect postgres-db
docker inspect docker-ci-cd-exercise_pgadmin_1
cd ..
docker-compose down
cd docker-ci-cd-exercise/
docker-compose down
exit
sudo apt update && sudo apt upgrate -y
mkdir airflow
cd airflow
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/3.1.5/docker-compose.yaml'
mkdir -p ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)" > .env
docker compose up airflow-init
docker-compose up airflow-init
vim docker-compose.yaml
exit
docker-compose up -d
cd airflow
docker-compose up -d
docker ps
ls
vim docker-compose.yaml 
ls
cd dags
vim airflow_i_ex_3.py
vim airflow_i_ex_4.py
ls
vim airflow_i_ex_5.py
cd airflow
docker ps
ls
cd dags
ls
vim airflow_i_ex_3.py
vim airflow_i_ex_4.py
vim airflow_i_ex_5.py
cd ..
cd airflow
docker-compose down
docker ps
exit
ls
mkdir metabase
ls
cd metabase
vim docker-compose.yml
cd ..
ls
docker_II
cd docker_II
ls
vim docker-compose.yml
cd ..
cd metabase
ls
vim docker-compose.yml
docker-compose up -d
ls
cd ..
cd docker_II
vim docker-compose.yml
ls
ls -la
vim docker-compose.yml
docker volume ls
cd ..
cd metabase/
docker volume ls
cd ..
cd metabase
docker-compose down
exit
ls
scp -r /mnt/c/Users/asimi/Documents/Data_Engineering_Bootcamp/imdb-top250-etl mina@157.180.67.45:~/
scp -r /home/amina/automated_etl_project mina@157.180.67.45:~/
ls
cd automated_etl_project/
ls
cd src
ls
cd ..
cd docker_II
ls
vim docker-compose.yml 
cd ..
cd automated_etl_project/
vim docker-compose.yaml
cd ..
cd docker_II
vim docker-compose.yml 
cd ..
cd automated_etl_project/
vim docker-compose.yaml
ls
rm docker-compose.yaml
ls
cd src
vim docker-compose.yml
rm docker-compose.yml
ls
cd ..
cd docker_II
vim docker-compose.yml 
cd ..
cd automated_etl_project/
cd src
ls
vim docker-compose.yml
cd ..
cd docker_II
ls
vim Dockerfile
vim requirements.txt
cd ..
cd automated_etl_project/
cd src
vim Dockerfile
vim requirements.txt
ls
cd ..
cd docker_II
ls
cd csv
ls
vim atp-rankings.csv 
cd ..
ls
vim webscraper-postgres.py
cd ..
cd automated_etl_project/
ls
cd src
ls
cd ../..
ls
cd docker_II
ls
vim Dockerfile
cd ..
cd automated_etl_project/
cd src
ls
vim requirements.txt 
docker ps
exit
ls
mkdir PySpark
docker pull jupyter/pyspark-notebook
ls
cd PySpark
ls
ls -la
cd ..
ls
rm PySpark
rmdir PySpark
ls
docker run -p 8888:8888 -v /home/amina/PySpark_Docker:/home/jovyan/work --name pyspark_notebook jupyter/pyspark-notebook
docker run -d -p 8888:8888 -v /home/amina/PySpark_Docker:/home/jovyan/work --name pyspark_notebook jupyter/pyspark-notebook 
docker ps
docker rm ccf417fb575aa6186ea9ca4281f6d976c940e670817435a62a315c5cf5ec3002
docker run -d -p 8888:8888 -v /home/amina/PySpark_Docker:/home/jovyan/work --name pyspark_notebook jupyter/pyspark-notebook 
docker ps
docker stop
docker stop 6d2f4fd3a893
docker ps
ls
docker volume
docker volume ls
docker volume rm 9a686b7ef2ceb57b7f0b3876d8d981222365b579ca66f1ee79d01b5c316ff514
docker volume rm 8036f9265f3fb054a75fac91bdebc1f526d248b6b4c1e63d67db821a9f7bbdb7
docker volume rm 9518f61f75395cbf8b48c2c6015a373225f2662dbf7cd2011abd79f245ebbbee
docker volume rm a20da941dc457f1623baf7ed751f6c643f4d01de2d3dae00e94d256365907db2
docker volume rm a43993badcc6a1b3225ae23a545d453891300ef6885817a4db174c3337acb0ab
docker volume ls
docker volume rm d4959f8ca7b7446b1286280fe6218c09d7aa11ce771ab8779d5662b365f14015
docker ls
docker ps -a
docker rm pyspark_notebook
ls
mkdir pyspark
ls
cd pyspark
ls
cd ..
ls
rm pyspark
rmdir pyspark
cd PySpark_Docker/
ls
pwd 
docker run -p 8888:8888 -v /home/mina/PySpark_Docker:/home/jovyan/work --name pyspark_notebook jupyter/pyspark-notebook
ls
docker ps
docker ps -a
exit
