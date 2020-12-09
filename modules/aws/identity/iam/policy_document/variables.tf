variable "statements" {
  type = list(object({ sid = string, effect = string, actions = list(string), resources = list(string), condition = list(object({ test = string, variable = string, values = list(string) })), principals = list(object({ type = string, identifiers = list(string) })) }))

  description = "List of nested configuration block allowing all type of policies statements (role, assume role and kms). Each statement set: sid (string), effect (string), actions (list), resources (list), condition (list of maps with: test (string), variable (string), values (list), principals (list of map with: type (string), identifiers (list)). Use each type zero value to skip any argument or block"
}
