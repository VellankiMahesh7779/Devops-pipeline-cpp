# ✅ Day 8 - Terraform Count

## Topics Covered

- Terraform `count`
- `count.index`
- Creating Multiple Resources

---

## What is `count`?

The `count` meta-argument is used to create multiple instances of the same resource using a single resource block.

---

## Example

```hcl
count = 3
```

Terraform creates:

- EC2 Instance 1
- EC2 Instance 2
- EC2 Instance 3

---

## What is `count.index`?

`count.index` returns the index of each resource, starting from **0**.

Example:

| count.index | Resource Name |
|-------------|---------------|
| 0 | Web-Server-1 |
| 1 | Web-Server-2 |
| 2 | Web-Server-3 |

Example:

```hcl
tags = {
  Name = "Web-Server-${count.index + 1}"
}
```

---

## When to Use `count`

Use `count` when you need to create **multiple identical resources**.

Examples:

- Multiple EC2 Instances
- Multiple EBS Volumes
- Multiple S3 Buckets

---

## Learning Outcome

✔ Learned how to create multiple resources using `count`.

✔ Used `count.index` to generate unique resource names.

✔ Reduced duplicate Terraform code by using a single resource block.
