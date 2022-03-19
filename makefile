build:
	docker build -t birkof/docker-mailcatcher .

run:
	docker run --rm=true -t -i -p 8080:80 birkof/docker-mailcatcher

clear:
	docker rmi -f birkof/docker-mailcatcher
