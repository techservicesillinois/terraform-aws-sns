# topic

Manage SNS topics.

Example Usage
-----------------

```hcl
  module "sns-topics" {
    source = "git@github.com:techservicesillinois/terraform-aws-sns//modules/topics"
  
    topics = [
      "authman-topic",
      "sso-topic",
      ]
  }
```

Argument Reference
-----------------

The following arguments are supported:

* `topics` – (Required) SNS topics to be managed.

* `tags` – (Optional) Tags to be applied to resources where supported.

Attributes Reference
--------------------

The following attributes are exported:

* `topic_arns` – List of managed topic ARNs.
