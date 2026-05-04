import json
import os
import sys

platform = sys.argv[1]
collectors = json.loads(sys.argv[2])
tenant_id = sys.argv[3]
tenant_endpoint = sys.argv[4]
customer_name = sys.argv[5]
distribution_id = sys.argv[6]
bucket_name = sys.argv[7]
descope_project_id = sys.argv[8]

with open("test/tenant_details.json", "r") as file:
    data = json.load(file)

new_tenant = {
    "platform": platform,
    "collectors": collectors,
    "tenant_id": tenant_id,
    "tenant_endpoint": tenant_endpoint,
    "ui": {
        "bucket": bucket_name,
        "distribution": distribution_id,
        "descope_project_id": descope_project_id,
    },
}

data[customer_name] = new_tenant

with open("test/tenant_details.json", "w") as file:
    json.dump(data, file, indent=4)
