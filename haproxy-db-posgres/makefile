.PHONY: all build_haproxy build_master build_slave deploy_haproxy deploy_master deploy_slave

HAPROXY_OUTPUT=haproxy_output.log
MASTER_OUTPUT=master_output.log
SLAVE_OUTPUT=slave_output.log

HAPROXY_IMG_TAG=$(shell grep 'A disk image was created:' $(HAPROXY_OUTPUT) | cut -d' ' -f8)
MASTER_IMG_TAG=$(shell grep 'A disk image was created:' $(MASTER_OUTPUT) | cut -d' ' -f8)
SLAVE_IMG_TAG=$(shell grep 'A disk image was created:' $(SLAVE_OUTPUT) | cut -d' ' -f8)

all: build_master deploy_master build_slave deploy_slave build_haproxy deploy_haproxy

build: build_haproxy build_master build_slave

apply: deploy_haproxy deploy_master deploy_slave

down: destroy_haproxy destroy_master destroy_slave

build_haproxy:
	touch $(HAPROXY_OUTPUT)
	packer build -force packer/haproxy.json 2>&1 | tee $(HAPROXY_OUTPUT)

build_master:
	touch $(MASTER_OUTPUT)
	packer build -force packer/master.json 2>&1 | tee $(MASTER_OUTPUT)

build_slave:
	touch $(SLAVE_OUTPUT)
	packer build -force packer/slave.json 2>&1 | tee $(SLAVE_OUTPUT)

deploy_haproxy:
	cd terraform/haproxy/ && terraform init -input=false
	cd terraform/haproxy/ && terraform apply -input=false -auto-approve -var="haproxy_image=$(HAPROXY_IMG_TAG)" -var="project_id=${PROJECT_ID}" -var="haproxy_static_ip=${HAPROXY_IP}" 2>&1 | tee terraform_haproxy_output.log

deploy_master:
	cd terraform/master/ && terraform init -input=false
	cd terraform/master/ && terraform apply -input=false -auto-approve -var="master_image=$(MASTER_IMG_TAG)" -var="project_id=${PROJECT_ID}" -var="master_static_ip=${MASTER_IP}" 2>&1 | tee terraform_master_output.log

deploy_slave:
	cd terraform/slave/ && terraform init -input=false
	cd terraform/slave/ && terraform apply -input=false -auto-approve -var="slave_image=$(SLAVE_IMG_TAG)" -var="slave1_static_ip=${SLAVE1_IP}" -var="project_id=${PROJECT_ID}" -var="slave2_static_ip=${SLAVE2_IP}" 2>&1 | tee terraform_slave_output.log

destroy_haproxy:
	cd terraform/haproxy/ && terraform init -input=false
	cd terraform/haproxy/ && terraform destroy -input=false -auto-approve -var="haproxy_image=$(HAPROXY_IMG_TAG)" -var="project_id=${PROJECT_ID}" -var="haproxy_static_ip=${HAPROXY_IP}" 2>&1 | tee terraform_haproxy_output.log

destroy_master:
	cd terraform/master/ && terraform init -input=false
	cd terraform/master/ && terraform destroy -input=false -auto-approve -var="master_image=$(MASTER_IMG_TAG)" -var="project_id=${PROJECT_ID}" -var="master_static_ip=${MASTER_IP}" 2>&1 | tee terraform_master_output.log

destroy_slave:
	cd terraform/slave/ && terraform init -input=false
	cd terraform/slave/ && terraform destroy -input=false -auto-approve -var="slave_image=$(SLAVE_IMG_TAG)" -var="slave1_static_ip=${SLAVE1_IP}" -var="project_id=${PROJECT_ID}" -var="slave2_static_ip=${SLAVE2_IP}" 2>&1 | tee terraform_slave_output.log