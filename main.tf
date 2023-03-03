# Creates the trainee in azure
resource "azuread_user" "trainee" {
  user_name = "codymorris@example.com"
  display_name = "C. Morris"
}

# Use correct argument in your configuration to force your trainer to change their passwords when s/he logins
resource "azuread_user" "trainer" {
  user_name = "ibrahimozbekler@examplecorp.com"
  display_name = "I. Ozbekler"
  force_password_change = "true"
}

resource "aws_iam_user" "new-users" {
    for_each = toset(var.users)
    name = each.value
}