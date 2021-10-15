#!/bin/bash

objectId=$1

echo " Post Deployment Setup for Azure Synapse Goes in here"

az synapse role assignment create --workspace-name hammerah01 \
                            --role "Synapse Contributor" \
                            --assignee-object-id $1
