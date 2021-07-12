UID=$(shell id -u)

help: ## Display command list
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

privilege: ## add user to docker group. After run "exec su -l $USER"
	sudo gpasswd -a ${USER} docker

run: ## run project
	docker-compose up -d

run-log: ## run project and show logs
	docker-compose up

stop: ## stop project
	docker-compose stop

build: ## build all services
	docker-compose build

build-nginx: ## build nginx service
	docker-compose build nginx

build-php: ## build php-fpm service
	docker-compose build php

uid:  ## change www-data id in container
	make run
	docker-compose exec php sh -c 'usermod -u ${UID} www-data'
	make stop

exec: ## jump into container
	docker-compose exec -u www-data php sh