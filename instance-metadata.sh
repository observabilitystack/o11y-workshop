#!/bin/bash
#
# Retrieve basic information from the metadata api
INSTANCE_ID=$(curl -s http://169.254.169.254/hetzner/v1/metadata/instance-id)
INSTANCE_IP=$(curl -s http://169.254.169.254/hetzner/v1/metadata/public-ipv4)

# Ask Hetzner API for full information
instance_metadata=$(curl -sH "Authorization: Bearer ${HCLOUD_TOKEN}" "https://api.hetzner.cloud/v1/servers/${INSTANCE_ID}")

# Parse select information
INSTANCE_TYPE=$(echo ${instance_metadata} | jq -r '.server.server_type.name')
INSTANCE_IMAGE=$(echo ${instance_metadata} | jq -r '.server.image.name')
INSTANCE_DATACENTER=$(echo ${instance_metadata} | jq -r '.server.datacenter.location.name')

cat << EOF
INSTANCE_ID=${INSTANCE_ID}
INSTANCE_IP=${INSTANCE_IP}
INSTANCE_TYPE=${INSTANCE_TYPE}
INSTANCE_IMAGE=${INSTANCE_IMAGE}
INSTANCE_DATACENTER=${INSTANCE_DATACENTER}
HOSTNAME=${HOSTNAME}
DOMAIN_NAME=${DOMAIN_NAME}
EOF
