
.PHONY : test
test:
	docker-compose run web rails test test/models/program_test.rb
