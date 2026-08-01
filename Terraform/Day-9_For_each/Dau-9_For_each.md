# ✅ Day 8 - Terraform `for_each`

## Topics Covered

- What is `for_each`?
- `for_each` with `toset()`
- `for_each` with Map
- `each.key`
- `each.value`
- Difference between `count` and `for_each`

---

## What is `for_each`?

`for_each` is a Terraform meta-argument used to create multiple resources with **different names or different configurations** using a **set** or **map**.

---

## `for_each` with `toset()`

Use `toset()` when you need to create multiple resources with different names but the same configuration.

**Example:**

```hcl
for_each = toset(["Web", "App", "DB"])
```

Creates:

- Web
- App
- DB

---

## `each.key`

`each.key` returns the current item from the set or the key from a map.

**Example:**

```hcl
tags = {
  Name = each.key
}
```

Result:

- Web
- App
- DB

---

## `for_each` with Map

A map stores **key-value pairs**, allowing each resource to have a different configuration.

**Example:**

```hcl
for_each = {
  Web = "t2.micro"
  App = "t2.small"
  DB  = "t2.medium"
}
```

---

## `each.key`

Returns the resource name.

```text
Web
App
DB
```

---

## `each.value`

Returns the value associated with the key.

```text
t2.micro
t2.small
t2.medium
```

Example:

```hcl
instance_type = each.value
```

---

## Difference Between `count` and `for_each`

| `count` | `for_each` |
|---------|------------|
| Creates multiple identical resources | Creates multiple resources with different names or configurations |
| Uses `count.index` | Uses `each.key` and `each.value` |
| Best for identical resources | Best for unique resources |

---

## When to Use `count`

- Multiple EC2 instances with the same configuration.
- Multiple identical EBS volumes.
- Multiple identical resources.

---

## When to Use `for_each`

- Web, App, and DB Servers.
- Multiple S3 buckets with different names.
- Resources with different configurations.

---

## Learning Outcome

✔ Learned how to create multiple resources using `for_each`.

✔ Understood the purpose of `each.key` and `each.value`.

✔ Learned the difference between `count` and `for_each`.

✔ Learned when to use `count` and when to use `for_each` in real-world projects.
