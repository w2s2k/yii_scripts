NAME = Yii2 Framework Scripts
VERSION=1.0
SRC=./remote
USER=wsilva
URL=//192.168.1.110
path=/htdocs/git
SERVER_PORT = 8989
PROJ=
URLPATH=


default:
	@echo
	@echo '$(NAME) - v($(VERSION))'
	@echo
	@echo 'Usage:  make <command> [options]'
	@echo
	@echo "These are common commands used in various sections:"
	@echo
	@echo
	@echo "  Local Files Server comands:"
	@echo
	@echo '   mount             mount local server '
	@echo '   unmount           unmount local server'
	@echo
	@echo "  Project comands:"
	@echo
	@echo '   server            init php server, SERVER_PORT default:8889'
	@echo '   browser           open opera browser in localhost, SERVER_PORT default:8889'
	@echo '   code              open vs code in path: ./$(SRC)/$(PROJ)'
	@echo
	@echo "  Composer comands:"
	@echo
	@echo '   install           install project dependencies from composer'
	@echo '   update            update project dependencies from composer'
	@echo '   basic             create an yiisoft/yii2-app-basic project inside ./$(SRC)/$(PROJ)'
	@echo '   advanced          create an yiisoft/yii2-app-advanced project inside ./$(SRC)/$(PROJ)'
	@echo '   init              init yii project inside ./$(SRC)/$(PROJ)'
	@echo '   migrate           migrate yii database in ./$(SRC)/$(PROJ)'
	@echo

mount:
	clear
	@echo "Trying to mount remote server ... "
	sudo mount -t cifs -o user=$(USER),iocharset=utf8,noperm $(URL)$(path)/$(PROJ) ./$(SRC)


unmount:
	clear
	@echo "Trying to umount remote server ... "
	sudo umount -l ./$(SRC)

server:
	if pgrep -x "php" > /dev/null; then \
		killall -9 php; \
	fi;
	clear
	@echo "Trying to start php server... path " ./$(SRC)/$(PROJ)
	cd ./$(SRC)/$(PROJ) && php -S localhost:$(SERVER_PORT)
	
browser:
	clear
	opera http://localhost:$(SERVER_PORT)/$(URLPATH)

code:
	cd ./$(SRC)/$(PROJ) && code .

install:
	cd ./$(SRC)/$(PROJ) && composer install

update:
	cd ./$(SRC)/$(PROJ) && composer update

basic:
	cd ./$(SRC) && php composer.phar create-project yiisoft/yii2-app-basic $(PROJ)

advanced:
	cd ./$(SRC) && php composer.phar create-project yiisoft/yii2-app-advanced $(PROJ)

init:
	cd ./$(SRC)/$(PROJ) && php init

migrate:
	cd ./$(SRC)/$(PROJ) && php yii migrate





