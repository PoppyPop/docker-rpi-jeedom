IMAGE := poppypop/rpi-jeedom
BRANCH := V4-stable

clean:
	rm -rf core

image:
	git clone https://github.com/jeedom/core.git -b $(BRANCH)
	sed -i 's|FROM debian:latest|FROM arm64v8/debian:stretch|g' core/Dockerfile
	docker build -t $(IMAGE) core/

push-image:
	docker push $(IMAGE)

.PHONY: image push-image clean

