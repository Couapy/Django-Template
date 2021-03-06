all:
	@echo "Welcome. You can use the help with 'make help'."

install:
	@echo "Silent mode enable. Installation in progress ..."

	@virtualenv .venv
	@echo "Virtual environnement '.venv' is enabled"

	@.venv/bin/pip3 install -r requirements.txt
	@echo "Dependencies required are installed."

	@mkdir -p src/app
	@mkdir -p var

	@.venv/bin/python3 src/manage.py collectstatic
	@echo "Static files are collected."

	@.venv/bin/python3 src/manage.py migrate
	@echo "Database migration done."

	@echo "Installation finished."

update:
	@git pull
	@.venv/bin/python3 src/manage.py migrate

run:
	@.venv/bin/python3 src/manage.py runserver

clean:
	@rm -rf .venv var

help:
	@echo "This is the help, the following commands are availables :"
	@echo "    install - Install the project"
	@echo "    update - Update the project"
	@echo "    clean - Clean the project (virtualenv and var folders)"
	@echo "    help - Show this help"
