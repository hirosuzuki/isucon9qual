export GO111MODULE=on

SRVIP=34.84.242.242

all: isucari

isucari: *.go
	go build -o isucari

deploy:
	ssh isucon@${SRVIP} sudo systemctl stop isucari.golang.service
	scp isucari isucon@${SRVIP}:/home/isucon/isucari/webapp/go/isucari
	scp 09_ex_schema.sql isucon@${SRVIP}:/home/isucon/isucari/webapp/sql/09_ex_schema.sql
	scp init.sh isucon@${SRVIP}:/home/isucon/isucari/webapp/sql/init.sh
	ssh isucon@${SRVIP} sudo systemctl start isucari.golang.service

deploy-service:
	cat isucari.golang.service | ssh isucon@${SRVIP} "sudo tee /etc/systemd/system/isucari.golang.service"
	ssh isucon@${SRVIP} sudo systemctl daemon-reload

deploy-nginx:
	cat nginx.conf | ssh isucon@${SRVIP} "sudo tee /etc/nginx/nginx.conf"
	ssh isucon@${SRVIP} sudo systemctl restart nginx

fetch-prof:
	ssh isucon@${SRVIP} sudo pkill -INT isucari || true
	scp isucon@${SRVIP}:/tmp/cpu.pprof cpu.pprof

pprof:
	go tool pprof -http="127.0.0.1:8020" cpu.pprof

kataribe:
	ssh isucon@${SRVIP} cat /var/log/nginx/access.log | ${HOME}/go/bin/kataribe

bench:
	ssh isucon@${SRVIP} "sudo mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d%H%M%S` || true" 
	ssh isucon@${SRVIP} "sudo systemctl restart nginx"
	ssh isucon@${SRVIP} "cd ./isucari && ./bin/benchmarker -target-url http://isucon9.catatsuy.org"
	ssh isucon@${SRVIP} cp /var/log/nginx/access.log /tmp/isucon/current/access.log

login:
	ssh isucon@${SRVIP}

parsesql:
	ssh isucon@${SRVIP} cat /tmp/sql.log | ./parse_sql_log.py

synclogs:
	rsync -av isucon@${SRVIP}:/tmp/isucon/ logs/
