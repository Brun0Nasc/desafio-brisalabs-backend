createdb:
	docker exec -it postgres14 createdb --username=root --owner=root db_brisa_pix

dropdb:
	docker exec -it postgres14 dropdb db_brisa_pix

migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/db_brisa_pix?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/db_brisa_pix?sslmode=disable" -verbose down

.PHONY: createdb dropdb migrateup migratedown