data "local_file" "tenant_details" {
  filename = "${path.module}/../tenant_details.json"
}

# Parse tenant details and get the greatest tenant ID
locals {
  tenant_ids = [
    for tenant in jsondecode(data.local_file.tenant_details.content) :
    tenant.tenant_id
  ]
  # Extract numeric part from the end of UUID (e.g., "00000000-0000-0000-0000-000000002026" -> 2026)
  tenant_numbers = [
    for tid in local.tenant_ids :
    tonumber(substr(tid, -4, 4))
  ]
  max_tenant_number  = length(local.tenant_numbers) > 0 ? max(local.tenant_numbers...) : 0
  next_tenant_id     = "00000000-0000-0000-0000-${format("%012d", local.max_tenant_number + 1)}"
  customer_tenant_id = local.next_tenant_id
}


resource "null_resource" "setup_tenant" {

  provisioner "local-exec" {
    command = <<-EOF
      python3 ../updating_json.py \
      "9878t6rfhji8y7t65rfghui8765" \
      '${jsonencode(var.collector)}' \
      ${local.customer_tenant_id} \
      "https://${var.customer_name}.singulr.ai" \
      ${var.customer_name}

    EOF
  }
}

