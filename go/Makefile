export GO111MODULE=on

SRVIP=34.84.242.242

all: isucari

isucari: *.go
	go build -o isucari

deploy:
	ssh isucon@${SRVIP} sudo systemctl stop isucari.golang.service
	scp isucari isucon@${SRVIP}:/home/isucon/isucari/webapp/go/isucari
	ssh isucon@${SRVIP} sudo systemctl start isucari.golang.service

kataribe:
	ssh isucon@${SRVIP} cat /var/log/nginx/kataribe.log | ${HOME}/go/bin/kataribe

bench:
	ssh isucon@${SRVIP} "sudo mv /var/log/nginx/kataribe.log /var/log/nginx/kataribe.log.`date +%Y%m%d%H%M%S` || true" 
	ssh isucon@${SRVIP} "sudo systemctl restart nginx"
	ssh isucon@${SRVIP} "cd ./isucari && ./bin/benchmarker -target-url http://isucon9.catatsuy.org"

login:
	ssh isucon@${SRVIP}
