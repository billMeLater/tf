variable "group-role" {
  default = {}
  type = map(list(string))
}

locals {
  role-group = flatten([
    for member in keys(var.group-role): [
      for value in var.group-role[member] : {
        role = value
        member = member
      }
    ]
  ])
}

resource "google_project_iam_member" "iam-group-role" {
  for_each =  {for o in local.role-group: "${o.member}:${o.role}" => o}

  project = var.project
  role = each.value["role"]
  member = "group:${each.value["member"]}"
}

//resource "google_project_iam_binding" "iam-binding" {
//  for_each = ?
//
//  project = var.project
//  role    = ?
//
//  members = ?
//}