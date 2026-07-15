## ✅ Day 4 - Terraform Remote Backend and State Management

### Tasks Completed

* Created an Amazon S3 bucket using Terraform.
* Configured the S3 bucket as a Terraform Remote Backend.
* Stored the `terraform.tfstate` file in the S3 bucket.
* Learned how DynamoDB is used to enable State Locking.

---
### Concepts Learned

#### Terraform State File (`terraform.tfstate`)
- Stores information about the infrastructure managed by Terraform.
- Helps Terraform track resources and detect changes.

#### Local Backend
- Stores the state file on the local machine.
- Suitable for individual learning and small projects.

#### Remote Backend
- Stores the state file in a shared location such as an Amazon S3 bucket.
- Enables team collaboration and centralized state management.

#### State Locking
- Prevents multiple users from modifying the Terraform state file simultaneously.
- Ensures infrastructure consistency and avoids state corruption.

#### Amazon DynamoDB
- Used along with the S3 Remote Backend to manage state locking.
- Allows only one Terraform operation to update the state file at a time.

---

### Learning Outcome

✔ Understood the purpose of the Terraform State File.

✔ Learned the difference between Local Backend and Remote Backend.

✔ Configured an Amazon S3 bucket as a Remote Backend.

✔ Learned how State Locking works using Amazon DynamoDB.

✔ Understood why Remote Backends are used in real-world team environments.
