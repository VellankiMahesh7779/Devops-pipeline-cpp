terraform init
= Initializes the Terraform project and downloads the required providers and modules.

terraform fmt
= Formats Terraform files to follow standard coding style.

terraform validate
= Checks whether the Terraform configuration is syntactically correct.

terraform plan
= Shows what changes Terraform will make before applying them.

terraform plan -out=tfplan
= Saves the execution plan to a file.

terraform apply
= Creates or updates infrastructure based on the Terraform configuration.

terraform apply -auto-approve
= Applies the changes without asking for confirmation.

terraform apply tfplan
= Applies the saved execution plan.

terraform destroy
= Deletes all resources created by Terraform.

terraform destroy -auto-approve
= Destroys all resources without confirmation.

terraform show
= Displays the current Terraform state or execution plan.

terraform output
= Displays all output values defined in outputs.tf.

terraform output <output_name>
= Displays a specific output value.

terraform state list
= Lists all resources tracked in the Terraform state file.

terraform state show <resource>
= Shows detailed information about a specific resource in the state.

terraform state rm <resource>
= Removes a resource from the state file without deleting it from the cloud.

terraform state mv <source> <destination>
= Moves or renames a resource in the state file.

terraform import <resource> <resource_id>
= Imports an existing cloud resource into Terraform state.

terraform workspace list
= Lists all available workspaces.

terraform workspace new <workspace_name>
= Creates a new workspace.

terraform workspace select <workspace_name>
= Switches to a different workspace.

terraform workspace show
= Displays the current active workspace.

terraform workspace delete <workspace_name>
= Deletes a workspace.

terraform providers
= Displays the providers used in the current configuration.

terraform version
= Displays the installed Terraform version.

terraform graph
= Generates a dependency graph of Terraform resources.

terraform console
= Opens an interactive Terraform console for testing expressions.

terraform force-unlock <LOCK_ID>
= Removes a stuck Terraform state lock.

terraform init -upgrade
= Upgrades provider plugins to the latest allowed versions.

terraform init -reconfigure
= Reconfigures the backend settings.

terraform init -migrate-state
= Migrates the Terraform state to a new backend.

terraform apply -replace=<resource>
= Forces Terraform to recreate a specific resource.

terraform apply -target=<resource>
= Applies changes only to a specific resource.
