include local.env

ifeq ("$(MAKEFILE_MODO_VERBOSE)",  "true")
SHELL = sh -xv
endif

DOCKER_IMAGE_OWNER='my5gcore'
DOCKER_IMAGE_NAME='base'
DOCKER_IMAGE_TAG='latest'

DOCKER_IMAGE_OWNER_UE='my5gcore'
DOCKER_IMAGE_NAME_UE='ue'
DOCKER_IMAGE_TAG_UE='latest'

base_free5gc:
	docker build --no-cache -t ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ./containers/base
	docker image ls ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}

base_my5gcore:
	docker build --no-cache  -t ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ./containers/base_old
	docker image ls ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}

base_ue:
	docker build --no-cache -t ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE} ./containers/base_iotsdgw
	docker image ls ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE}

base_ue2:
	docker build --no-cache -t ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE} ./containers/base_iotsdgw2
	docker image ls ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE}


build_docker_compose_scenary1: ## Construa o docker-compose.yml baseado no arquivo envlocal.env
	rm -f orquestrators/*.yml


	envsubst < orquestrators/templates/chirpstack-template.yml  > orquestrators/chirpstack-compose.yml
	envsubst < orquestrators/templates/iotsdgw-template.yml > orquestrators/iotsdgw-compose.yml
	## Create network# docker network create lorawan

	## LoRAWAN configuration
	@sed -i'' -e "s/{{ network }}/lorawan/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ app }}/8080/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ mosquitto }}/1883/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ bridge }}/1700/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ bridgeip }}/10.100.120.10/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ octect }}/120/g" orquestrators/chirpstack-compose.yml
	
	## IotSDGW configuration
	@sed -i'' -e "s/{{ network }}/lorawan/g" orquestrators/iotsdgw-compose.yml
	@sed -i'' -e "s/{{ ue }}/non3gpp1/g" orquestrators/iotsdgw-compose.yml
	@sed -i'' -e "s/{{ ip }}/2/g" orquestrators/iotsdgw-compose.yml

	@sed -i'' -e "s/{{ args }}/nonUE 10.100.120.10/g" orquestrators/iotsdgw-compose.yml


build_docker_compose_scenary2:
	rm -f orquestrators/*.yml

	envsubst < orquestrators/templates/chirpstack-template.yml  > orquestrators/chirpstack-compose.yml
	envsubst < orquestrators/templates/my5gcore-template.yml  > orquestrators/core-compose.yml
	envsubst < orquestrators/templates/iotsdgw-template.yml > orquestrators/iotsdgw-compose.yml

	## LoRAWAN configuration
	@sed -i'' -e "s/{{ network }}/lorawan/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ app }}/8080/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ mosquitto }}/1883/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ bridge }}/1700/g" orquestrators/chirpstack-compose.yml
	@sed -i'' -e "s/{{ bridgeip }}/10.100.120.10/g" orquestrators/chirpstack-compose.yml	   
	@sed -i'' -e "s/{{ octect }}/120/g" orquestrators/chirpstack-compose.yml
	
	## IotSDGW configuration
	docker network create 5gcorenetwork
	@sed -i'' -e "s/{{ network }}/orquestrators_5gcorenetwork/g" orquestrators/iotsdgw-compose.yml
	@sed -i'' -e "s/{{ ue }}/non3gpp1/g" orquestrators/iotsdgw-compose.yml
	@sed -i'' -e "s/{{ ip }}/2/g" orquestrators/iotsdgw-compose.yml
	@sed -i'' -e "s/{{ args }}/StartupUe 10.100.120.10/g" orquestrators/iotsdgw-compose.yml
	
	## Network core configuration
	@sed -i'' -e "s/{{ internet1 }}/lorawan/g" orquestrators/core-compose.yml

build_docker_compose_scenary3:
	rm -f orquestrators/*.yml

	envsubst < orquestrators/templates/chirpstack-template.yml  > orquestrators/chirpstack-compose1.yml
	envsubst < orquestrators/templates/chirpstack-template.yml  > orquestrators/chirpstack-compose2.yml

	envsubst < orquestrators/templates/my5gcoreMPath-template.yml  > orquestrators/core-compose.yml

	envsubst < orquestrators/templates/iotsdgw-template.yml > orquestrators/iotsdgw1-compose.yml
	envsubst < orquestrators/templates/iotsdgw-template.yml > orquestrators/iotsdgw2-compose.yml

	## LoRAWAN configuration
	@sed -i'' -e "s/{{ network }}/lorawan1/g" orquestrators/chirpstack-compose1.yml
	@sed -i'' -e "s/{{ app }}/8080/g" orquestrators/chirpstack-compose1.yml
	@sed -i'' -e "s/{{ mosquitto }}/1883/g" orquestrators/chirpstack-compose1.yml
	@sed -i'' -e "s/{{ bridge }}/1700/g" orquestrators/chirpstack-compose1.yml
	@sed -i'' -e "s/{{ bridgeip }}/10.100.120.10/g" orquestrators/chirpstack-compose1.yml	       
	@sed -i'' -e "s/{{ octect }}/120/g" orquestrators/chirpstack-compose1.yml
	
	@sed -i'' -e "s/{{ network }}/lorawan2/g" orquestrators/chirpstack-compose2.yml
	@sed -i'' -e "s/{{ app }}/8081/g" orquestrators/chirpstack-compose2.yml
	@sed -i'' -e "s/{{ mosquitto }}/1884/g" orquestrators/chirpstack-compose2.yml
	@sed -i'' -e "s/{{ bridge }}/1701/g" orquestrators/chirpstack-compose2.yml
	@sed -i'' -e "s/{{ bridgeip }}/10.100.130.10/g" orquestrators/chirpstack-compose2.yml	       
	@sed -i'' -e "s/{{ octect }}/130/g" orquestrators/chirpstack-compose2.yml
	
	## IotSDGW configuration
	@sed -i'' -e "s/{{ network }}/5gcorenetwork/g" orquestrators/iotsdgw1-compose.yml
	@sed -i'' -e "s/{{ ue }}/non3gpp1/g" orquestrators/iotsdgw1-compose.yml
	@sed -i'' -e "s/{{ ip }}/2/g" orquestrators/iotsdgw1-compose.yml
	@sed -i'' -e "s/{{ args }}/StartupUe 10.100.120.10/g" orquestrators/iotsdgw1-compose.yml
	
	@sed -i'' -e "s/{{ network }}/5gcorenetwork/g" orquestrators/iotsdgw2-compose.yml
	@sed -i'' -e "s/{{ ue }}/non3gpp2/g" orquestrators/iotsdgw2-compose.yml
	@sed -i'' -e "s/{{ ip }}/3/g" orquestrators/iotsdgw2-compose.yml
	@sed -i'' -e "s/{{ args }}/StartupUe 10.100.130.10/g" orquestrators/iotsdgw2-compose.yml
	
	## Network core configuration
	@sed -i'' -e "s/{{ internet1 }}/lorawan1/g" orquestrators/core-compose.yml
	@sed -i'' -e "s/{{ internet2 }}/lorawan2/g" orquestrators/core-compose.yml

run1: ## RUN
	envsubst < orquestrators/scenary1/iotsdgw-compose.yml  > orquestrators/scenary1/iotsdgw-compose.yml

run2: ## RUN
	docker-compose -f orquestrators/chirpstack-compose.yml up -d
	docker-compose -f orquestrators/core-compose.yml up -d
	docker-compose -f orquestrators/iotsdgw-compose.yml up -d

run3: ## RUN
	docker-compose -f chirpstack-compose1.yml up -d
	docker-compose -f chirpstack-compose2.yml up -d
	docker-compose -f core-compose.yml up -d
	docker-compose -f iotsdgw1-compose.yml up -d
	docker-compose -f iotsdgw2-compose.yml up -d

clear:
	docker-compose -f orquestrators/chirpstack-compose.yml down --remove-orphans

setup: ##
ifeq ("$(SCENARY)", "")
	@echo "SCENARY VAR ARGS IS NULL"

else ifeq ("$(SCENARY)", "1")
	make base_ue
	make build_docker_compose_scenary1
	make run1

else ifeq ("$(SCENARY)", "2")
	make base_core
	make base_ue
	make build_docker_compose_scenary2
	make run2

else ifeq ("$(SCENARY)", "3")
	make base_core
	make base_ue
	make build_docker_compose_scenary3
	make run3
else
	@echo "SENARY VAR ARGS IS NOT RANGE 1..3"
endif

help: ## Lista de comandos disponiveis  descricao. Voce pode usar TAB para completar os comandos
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

