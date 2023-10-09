# subscription

Manage subscriptions to various SNS topics.

Example Usage
-----------------

```hcl
  module "sns-subscription" {
    source = "git@github.com:techservicesillinois/terraform-aws-sns//modules/subscription"

    subscriptions = {
      "sso-topic" = [
        {
        protocol = "email"
        endpoint = "sso-admin@example.com"
        }
      ],

      "vpn-monitor-topic" = [
        {
        protocol = "email"
        endpoint = "vpn-admin@example.com"
        },

        {
        protocol = "sms"
        endpoint = "vpn-admin-pager@example.com"
        },
      ]
    }
  }

```

Argument Reference
-----------------

The following argument is supported:

* `subscriptions` - (Required) Map of lists defining SNS subscriptions. Each key is an existing SNS topic, and each member of the list is an object that defines a subscription to be managed for the corresponding SNS topic. Each object specifies the endpoint and protocol for the corresponding subscription.

Attributes Reference
--------------------

The following attributes are exported:

* `arns` – a list of ARNs for each subscription to the specified topics.
