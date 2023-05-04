# kinesis-firehose-addon

The `kinesis-firehose-addon` generates an AWS IAM Policy that grants permissions to publish to the given AWS Kinesis Firehose.
The policy will be attached to the AWS IAM Role specified by `var.iam_role_name`, if specified.

Kinesis Firehoses Delivery Streams must be tagged with `${var.tag_name}=${var.environment}` in order to be accessible by this addon.

```hcl
module "kinesis_firehose_access" {
  source  = "symopsio/kinesis-firehose-addon/aws"
  version = ">= 1.0.0"

  environment = local.environment
  iam_role_name = module.runtime_connector.sym_runtime_connector_role.name
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.attach_firehose_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The unique name of the environment in which you are deploying this AWS IAM Policy (e.g. staging, or prod). | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | If specified, the generated AWS IAM Policy will be attached to the AWS IAM Role identified by this value. | `string` | `""` | no |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | Name of the tag that resources must be tagged with to be accessible by this addon. | `string` | `"SymEnv"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to apply to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | The ARN of the generated AWS IAM Policy that grants permissions to publish to Kinesis Firehose. |
<!-- END_TF_DOCS -->
