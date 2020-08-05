export GO111MODULE=on

all: isucari

isucari: *.go
	go build -o isucari

deploy:
	ssh isucon@34.84.63.28 sudo systemctl stop isucari.golang.service
	scp isucari isucon@34.84.63.28:/home/isucon/isucari/webapp/go/isucari
	ssh isucon@34.84.63.28 sudo systemctl start isucari.golang.service

kataribe:
	ssh isucon@34.84.63.28 cat /var/log/nginx/kataribe.log | ${HOME}/go/bin/kataribe

bench:
	ssh isucon@34.84.63.28 "sudo mv /var/log/nginx/kataribe.log /var/log/nginx/kataribe.log.`date +%Y%m%d%H%M%S` || true" 
	ssh isucon@34.84.63.28 "sudo systemctl restart nginx"
	ssh isucon@34.84.63.28 "cd ./isucari && ./bin/benchmarker -target-url http://isucon9.catatsuy.org"

login:
	ssh isucon@34.84.63.28
