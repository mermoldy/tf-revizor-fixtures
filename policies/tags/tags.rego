package terraform

import input.tfplan as tfplan


allowed_platforms = ["aws", "azurerm", "google"]
allowed_tags_key = ["owner", "test-env-owner"]
clouds_with_tags = ["aws", "azurerm"]


res := tfplan.resource_changes

allowed_resources := [r | r = res[_]; allowed_platforms[_] == r.provider_name]
resources := [r | r = allowed_resources[_]; not "delete" == r.change.actions[0]]




#Check tags has owner key
deny[msg] {
    r := resources[_]
    clouds_with_tags[_] == r.provider_name
    allowed_tags := [tag | tag := allowed_tags_key[_]; r.change.after.tags[tag]]
    count(allowed_tags) == 0
    msg := sprintf("Owner tag not exist on %s resource '%s' containes '%s'", [r.provider_name, r.address, r.change.after.tags])
}

# fix for gce
deny[msg] {
    r := resources[_]
    r.provider_name == "google"
    allowed_tags := [tag | tag := allowed_tags_key[_]; r.change.after.labels[tag]]
    count(allowed_tags) == 0
    msg := sprintf("Owner tag not exist on GCE resource '%s'", [r.address])
}
