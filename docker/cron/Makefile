.PHONY: default install list logs buildx notify

default: install

install:
	@docker exec -it cron crontab /root/crontabs/cron

list:
	@docker exec -it cron crontab -l

logs:
	@tail -f logs/*.log

buildx:
	@docker buildx build --platform=linux/arm64/v8,linux/amd64 --push --tag qsoyq/cron:latest .
	@make notify

notify:
	@if [ -n ${BARK_TOKEN} ]; then curl https://api.day.app/$(BARK_TOKEN)/docker-images%20cron%20makefile%20run%20success; fi;
