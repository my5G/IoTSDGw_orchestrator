ifeq ("$(MAKEFILE_MODO_VERBOSE)",  "true")
SHELL = sh -xv
endif

DOCKER_IMAGE_OWNER='free5gc'
DOCKER_IMAGE_NAME='base'
DOCKER_IMAGE_TAG='latest'

DOCKER_IMAGE_OWNER_UE='my5gcore'
DOCKER_IMAGE_NAME_UE='ue'
DOCKER_IMAGE_TAG_UE='latest'

base:
	docker build --no-cache -t ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ./containers/base
	docker image ls ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}

non3gpp:
	docker build --no-cache -t ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE} ./containers/base_iotsdgw
	docker image ls ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE}

iotsdgw:
	docker build --no-cache -t ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE} ./containers/base_iotsdgw2
	docker image ls ${DOCKER_IMAGE_OWNER_UE}/${DOCKER_IMAGE_NAME_UE}:${DOCKER_IMAGE_TAG_UE}

deps:


run:


help: ## Lista de comandos disponiveis  descricao. Voce pode usar TAB para completar os comandos
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

