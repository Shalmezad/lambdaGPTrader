
cleanup:
	docker ps -a | grep "lambda_gp_trader_web" | awk '{print $$1}' | xargs docker rm

.PHONY : test
test:
	docker-compose run web rails test test/models/program_test.rb
