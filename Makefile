
#run:
#	venv\Scripts\flask run


#test:
#	pytest

build:
	docker build -t student-api:1.0.0 .

run:
	docker run -d -p 4000:4000 --env DATABASE_URL=sqlite:///students.db student-api:1.0.0

stop:
	docker stop $(docker ps -q --filter ancestor=student-api:1.0.0)

clean:
	docker rmi student-api:1.0.0

