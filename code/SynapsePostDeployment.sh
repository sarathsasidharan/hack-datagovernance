#!/bin/bash

synapseContributorsObjId=$1

echo " Post Deployment Setup for Azure Synapse Goes in here ,for the main trigger refer to main.bicep under infra"

# Set the Group of Synapse Contributors 
az synapse role assignment create --workspace-name hammerah01 \
                            --role "Synapse Contributor" \
                            --assignee-object-id $synapseContributorsObjId
