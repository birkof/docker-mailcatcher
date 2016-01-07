build:
	sudo docker build -t birkof/docker-mailcatcher .

run:
	sudo docker run --rm=true -t -i -p 1080:1080 birkof/docker-mailcatcher

clear:
	sudo docker rmi -f birkof/docker-mailcatcher