build-up:
	docker compose up --build -d --remove-orphans

build:
	docker compose build

bash:
	docker compose run app bash

up:
	docker compose up

up-d:
	docker compose up -d

down:
	docker compose down --remove-orphans

show_logs:
	docker compose logs

config:
	docker compose  config

migrate:
	docker compose run app python3 manage.py migrate

shell:
	docker compose run app python3 manage.py shell

test:
	docker compose run app python3 manage.py test

makemigrations:
	docker compose run app python3 manage.py makemigrations

collectstatic:
	docker compose run app python3 manage.py collectstatic --no-input --clear

superuser:
	docker compose run app python3 manage.py createsuperuser

dump_data:
	docker compose run app python3 manage.py dumpdata users.user --indent 4 > users.json
	docker compose run app python3 manage.py dumpdata shs.vendor shs.sector shs.region shs.state --indent 4 > ven_sec_reg_state.json
	docker compose run app python3 manage.py dumpdata shs --indent 4 > shs.json

load_data:
	docker compose run app python3 manage.py loaddata ven_sec_reg_state.json
	docker compose run app python3 manage.py loaddata users.json
	docker compose run app python3 manage.py loaddata shs.json

down-v:
	docker compose down -v
