all: volumes hosts
	@echo $(F_GREEN)":::✅ Containers are ready ✅:::"$(NONE)
	@echo $(CURSIVE)$(GRAY)":::Running the containers $(NAME):::"$(NONE)
	@sudo docker-compose -f $(YML_PATH) up --build

volumes:
	@echo $(CURSIVE)$(GRAY)":::Creating volumes directories:::"$(NONE)
	@sudo mkdir -p $(WP_VOLUME_DIR)
	@sudo mkdir -p $(MDB_VOLUME_DIR) 
	@sudo chmod 777 $(WP_VOLUME_DIR)
	@sudo chmod 777 $(MDB_VOLUME_DIR)
	@echo $(GREEN)":::✅ Volumes directories are ready ✅:::"$(NONE)

hosts:
	@echo $(CURSIVE)$(GRAY)":::Editing hosts:::"$(NONE)
	@if ! grep -qFx "127.0.0.1 $(LOGIN).42.fr" /etc/hosts; then \
		sudo sed -i '2i\127.0.0.1\t$(LOGIN).42.fr' /etc/hosts; \
	fi
	@echo $(GREEN)":::✅ Hosts are ready ✅:::"$(NONE)

down:
	@echo $(CURSIVE)$(GRAY)":::Stoping the containers:::"$(NONE)
	@docker-compose -f $(YML_PATH) down
	@echo $(RED)":::Containers stoped:::"$(NONE)

up:
	@echo $(CURSIVE)$(GRAY)":::Starting the containers:::"$(NONE)
	@sudo docker-compose -f $(YML_PATH) up

fclean: down
	@echo $(CURSIVE)$(GRAY)":::Deleting volumes:::"$(NONE)
	@sudo rm -rf $(WP_VOLUME_DIR)
	@sudo rm -rf $(MDB_VOLUME_DIR)
	@sudo docker volume rm $(WP_VOLUME)
	@sudo docker volume rm $(MDB_VOLUME)
	@sudo docker system prune -af
	@echo $(RED)":::Deleted:::"$(NONE)

re: fclean all

.PHONY:all volumes hosts down fclean re 

WP_VOLUME=srcs_wordpress
MDB_VOLUME=srcs_mariadb
WP_VOLUME_DIR=/home/$(LOGIN)/data/wordpress/
MDB_VOLUME_DIR=/home/$(LOGIN)/data/mariadb/
LOGIN=rerayyad
YML_PATH=srcs/docker-compose.yml

NONE='\033[0m'
F_GREEN='\e[92;5;118m'
GREEN='\033[0;32m'
GRAY='\033[2;37m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
CURSIVE='\033[3m'
