all: run

run:
	docker-compose up

down:
	docker-compose down

update:
	docker-compose run site bundle update

test:
	docker-compose run site bundle exec rake test

build:
	docker-compose run site bundle exec rake build
