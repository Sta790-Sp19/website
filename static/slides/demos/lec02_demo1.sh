# Setup

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce
sudo systemctl start docker

sudo groupadd docker
sudo usermod -aG docker $USER
groups



$ docker run -it --name my_r_container ubuntu:18.10 


# in container
$ ls
$ apt update
$ apt install r-base
$ R
$ apt install software-properties-common
$ add-apt-repository ppa:marutter/c2d4u3.5
$ apt update
$ apt install r-cran-dplyr
$ exit

# Back on vm
$ docker images --all
$ docker container ls
$ docker container ls --all
$ docker start my_r_container
$ docker attach my_r_container

# back in container
$ apt install r-cran-ggplot2
$ exit

# Container -> image

$ docker commit my_r_container rundel/cosmic_dplyr_ggplot
$ docker images
$ docker container ls --all
$ docker rm my_r_container
$ docker container ls --all


# Simple analysis / file output
$ mkdir results
$ docker run -it --rm -v ~/results:/results rundel/cosmic_dplyr_ggplot 

library(dplyr)
data_frame(x = rnorm(10), y = rnorm(10)) %>% write.csv(file="results/data.csv")

$ ls ~/results
$ cat ~/results/data.csv


$ docker run -it --name cosmic_rstudio rundel/cosmic_dplyr_ggplot
# Inside again
$ useradd test
$ passwd test
$ mkhomedir_helper test
$ apt install wget
$ wget https://s3.amazonaws.com/rstudio-ide-build/server/trusty/amd64/rstudio-server-1.2.1237-amd64.deb
$ dpkg -i rstudio-server-1.2.1237-amd64.deb
$ apt --fix-broken install


$ docker container ls --all
$ docker commit cosmic_rstudio rundel/cosmic_rstudio

$ docker run -it --rm -p 8787:8787 rundel/cosmic_rstudio
# /usr/lib/rstudio-server/bin/rserver --server-daemonize=0

