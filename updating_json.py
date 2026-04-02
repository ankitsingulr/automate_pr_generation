import json
import os
import boto3
import sys

platform = sys.argv[1]
collectors = json.loads(sys.argv[2])
tenant_id = sys.argv[3]
tenant_endpoint = sys.argv[4]
customer_name = sys.argv[5]


with open('../tenant_details.json', 'r') as file:
    data = json.load(file)

new_tenant = {
    "platform": platform,
    "collectors": collectors,
    "tenant_id": tenant_id,
    "tenant_endpoint": tenant_endpoint
} 

data[customer_name] = new_tenant

with open('../tenant_details.json', 'w') as file:
    json.dump(data, file, indent=4)
