module isucari

go 1.14

require (
	github.com/go-sql-driver/mysql v1.4.1
	github.com/gorilla/sessions v1.2.0
	github.com/hirosuzuki/go-isucon-tracer v0.0.0-00010101000000-000000000000
	github.com/jmoiron/sqlx v1.2.0
	goji.io v2.0.2+incompatible
	golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4
	google.golang.org/appengine v1.6.6 // indirect
)

replace github.com/hirosuzuki/go-isucon-tracer => ../../go-isucon-tracer
