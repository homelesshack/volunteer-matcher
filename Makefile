serve:
	docker-compose build
	docker-compose run web bundle exec rails db:setup
	docker-compose up

test:
	docker-compose run web bundle exec rspec
