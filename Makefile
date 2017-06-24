serve:
	docker-compose build
	docker-compose run web bundle exec rails db:create db:migrate
	docker-compose up

test:
	docker-compose run web bundle exec rspec
