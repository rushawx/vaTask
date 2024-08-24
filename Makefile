infra_up:
	docker compose up -d

infra_down:
	docker compose down --volumes

task_1_etl:
	bash etl.sh

task_2_mart:
	bash mart.sh

task_3_errors:
	bash errors.sh
