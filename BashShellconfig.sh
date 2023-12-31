##Install Docker

sudo apt-get --assume-yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

##echo "deb [arch=arm64] https://download.docker.com/linux/ubuntu focal stable" | sudo tee > /etc/apt/sources.list.d/docker.list 
##curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update -qq
##sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
##sudo docker ps

## Run Hello Workd

##sudo docker run hello-world

##Make Docker Volumes Sane

# Might want to add this to your ~/.bashrc (optional)
##export GOPATH="${HOME}/src/go"
##export PATH="${GOPATH}/bin:${PATH}"

# Setup our build environment
##sudo apt-get install golang
##mkdir -p ${GOPATH}/bin
##curl https://glide.sh/get | sh

##Building Golang plugin for Docker Volumes
    # Fetch the local-persist source
##    mkdir -p ${GOPATH}/src/github.com/MatchbookLab
    # cd ${GOPATH}/src/github.com/MatchbookLab
    # git clone https://github.com/MatchbookLab/local-persist.git
    # cd local-persist/

    # Install dependencies
#     glide install

#     # Build our arm64 binary
#     make binary

# # The install process
# sudo mv bin/local-persist /usr/bin/docker-volume-local-persist
# chmod +x /usr/bin/docker-volume-local-persist 
# sudo mv init/systemd.service /etc/systemd/system/docker-volume-local-persist.service
# sudo systemctl daemon-reload
# sudo systemctl enable docker-volume-local-persist
# sudo systemctl start docker-volume-local-persist


curl -fsSL https://raw.githubusercontent.com/MatchbookLab/local-persist/master/scripts/install.sh | sudo bash
# Just in case
sudo service docker restart

##Install Portainer for MGMT

# Lets make a place to store our configuration
export PERSIST_DATA_PATH="${HOME}/src/home-assistant-config"
mkdir -p ${PERSIST_DATA_PATH}/data
cd ${PERSIST_DATA_PATH}
${EMAIL}="test@example.com"
${DOMAIN}="example.com"
${DOMAIN2}="example.com"

##Make Docker Compose Yaml 1 at this point Call this file docker-compose.yaml in the OS and place in ${HOME}/src/home-assistant-config"
cd ${HOME}/src/home-assistant-config
curl -o docker-compose.yaml https://raw.githubusercontent.com/DWBatmanPS/DockerConfig/main/Docker_Compose_yaml_1.yaml

# Bring up our defined services and detach into the background
sudo docker-compose -f docker-compose.yaml up -d

cd ${HOME}/src/home-assistant-config

# Lets make a new file to store our environment configuration
#   and add our data storage variable to the new file
cd ${HOME}/src/home-assistant-config
echo PERSIST_DATA_PATH="${HOME}/src/home-assistant-config" > .env

##Update Docker Compose YAML to contents of Docker_Compose_yaml_2.yaml
cd ${HOME}/src/home-assistant-config
curl -o docker-compose.yaml https://raw.githubusercontent.com/DWBatmanPS/DockerConfig/main/Docker_Compose_yaml_2.yaml

# set the letsencrypt email
cd ${HOME}/src/home-assistant-config
echo LETSENCRYPT_ACME_EMAIL=${EMAIL}>> .env

# set your internal domain (maybe something like pi.lan)
cd ${HOME}/src/home-assistant-config
echo INTERNAL_DOMAIN=${DOMAIN} >> .env

# set your external domain (maybe something like example.com)
cd ${HOME}/src/home-assistant-config
echo EXTERNAL_DOMAIN=${DOMAIN2} >> .env

##Build new environment.
sudo docker-compose -f docker-compose.yaml up -d

##Update Docker Compose YAML to contents of Docker_Compose_yaml_3.yaml
cd ${HOME}/src/home-assistant-config
ncurl -o docker-compose.yaml https://raw.githubusercontent.com/DWBatmanPS/DockerConfig/main/Docker_Compose_yaml_3.yaml

##Build new environment.
sudo docker-compose -f docker-compose.yaml up -d

##Setup the file docker-compose-ha.yaml in the os and place in ${HOME}/src/home-assistant-config
cd ${HOME}/src/home-assistant-config
curl -o docker-compose-ha.yaml https://raw.githubusercontent.com/DWBatmanPS/DockerConfig/main/Docker_Compose_HA_yaml_1.yaml

##Build new environment.
sudo docker-compose -f docker-compose-ha.yaml up -d

##Update Docker Compose Yaml to content of Docker_Compose_HA_yaml_4.yaml
cd ${HOME}/src/home-assistant-config
curl -o docker-compose.yaml https://raw.githubusercontent.com/DWBatmanPS/DockerConfig/main/Docker_Compose_HA_yaml_4.yaml

##Build new environment.
sudo docker-compose -f docker-compose.yaml up -d

