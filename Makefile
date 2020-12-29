TEMPLATE_NAME ?= janus-webrtc-gateway-docker

build: 
	@docker build -t atyenoria/$(TEMPLATE_NAME) .

build-nocache: 
	@docker build --no-cache -t atyenoria/$(TEMPLATE_NAME) .

bash: 
	@docker run --net=host -v /home/ubuntu:/ubuntu -it -t atyenoria/$(TEMPLATE_NAME) /bin/bash

attach: 
	@docker exec -it janus /bin/bash

run: 
	@docker run --net=host -v ./config:/opt/janus/etc/janus/ -it -t atyenoria/$(TEMPLATE_NAME)

run_full: 
	@docker run --net=host -v /$(PWD)/config/janus.jcfg:/opt/janus/etc/janus/janus.jcfg -v /$(PWD)/nginx.conf:/usr/local/nginx/nginx.conf -v /$(PWD)/ssl:/opt/ssl -v /$(PWD)/config/janus.transport.http.jcfg:/opt/janus/etc/janus/janus.transport.http.jcfg -it -t atyenoria/janus-webrtc-gateway-docker

run-mac: 
	@docker run -p 80:80 -p 8088:8088 -p 8188:8188 --name="janus" -it -t atyenoria/$(TEMPLATE_NAME)

run-hide: 
	@docker run --net=host --name="janus" -it -t atyenoria/$(TEMPLATE_NAME) >> /dev/null
