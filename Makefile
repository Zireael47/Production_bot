run-bot:
	python bot.py

run-webapp:
	python webapp.py

run-updater:
	python updater.py

gen-cert:
	( [ ! -d ssl/ ] && mkdir ssl/ ) || true
	openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out ./ssl/cert.pem -keyout ./ssl/key.pem

create-db:
	sqlite3 data/bot.db < sql/create.sql
