resource "harvester_volume" "mount-disk" {

  for_each = var.disk_settings

  name      = "${var.vm_prefix}-${each.key}"
  namespace = var.namespace

  size = each.value
}
