package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/azure"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestSubnetServiceEndpointsExample(t *testing.T) {
	t.Parallel()

	// Create values for Terraform
	subscriptionID := "" // subscriptionID is overridden by the environment variable "ARM_SUBSCRIPTION_ID"

	// Configure Terraform setting up a path to Terraform code.
	terraformOptions := &terraform.Options{
		// Relative path to the Terraform dir
		TerraformDir: "../examples/service_endpoints",
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Run `terraform init` and `terraform apply`. Fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	expectedRgName := terraform.Output(t, terraformOptions, "resource_group_name")
	expectedVNetName := terraform.Output(t, terraformOptions, "virtual_network_name")
	expectedSNetName := terraform.Output(t, terraformOptions, "name")

	// Test for resource presence
	t.Run("Exists", func(t *testing.T) {
		// Check the Resource Group
		assert.True(t, azure.ResourceGroupExists(t, expectedRgName, subscriptionID))
		// Check the Virtual Network exists
		assert.True(t, azure.VirtualNetworkExists(t, expectedVNetName, expectedRgName, subscriptionID))
		// Check the Subnet exists
		assert.True(t, azure.SubnetExists(t, expectedSNetName, expectedVNetName, expectedRgName, subscriptionID))
	})
}
