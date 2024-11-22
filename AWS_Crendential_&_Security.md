# Overview of AWS IAM roles and Security

### AWS Security Credentials and Access

When you interact with AWS, you specify your AWS security credentials to verify who you are and whether you have permission to access the resources that you are requesting. AWS uses the security credentials to authenticate and authorize your requests.

For example:
- If you want to download a protected file from an Amazon Simple Storage Service (Amazon S3) bucket, your credentials must allow that access.
- If your credentials don't show you are authorized to download the file, AWS denies your request.
- However, your AWS security credentials aren't required for you to download a file in an Amazon S3 bucket that is publicly shared.

### Types of AWS Users and Their Security Credentials

1. **Account owner (root user)**
    - The user who created the AWS account and has full access.

2. **AWS IAM Identity Center users**
    - Users managed in AWS IAM Identity Center.

3. **Federated users**
    - Users from external identity providers who are granted temporary access to AWS through federation.
    - For more information about federated identities, see [Identity providers and federation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers.html).

4. **IAM users**
    - Individual users created within the AWS Identity and Access Management (IAM) service.

### What is IAM? 
# AWS IAM Basics

**What is IAM?**  
AWS Identity and Access Management (IAM) lets you securely manage who can access AWS resources and what they can do with them. It handles two key things:
1. **Authentication**: Verifying identity (who’s signing in).
2. **Authorization**: Granting permissions to access resources.

---

## Key Concepts

### 1. **Root User**
- The account owner with full access to everything.
- **Tip**: Don’t use the root user for everyday tasks. Only use it for critical account-level actions.

### 2. **IAM Identities**
- Create separate identities for users like admins, developers, or analysts.
- Assign specific permissions to control what they can access.

---

## How It Works

1. **Sign-In (Authentication)**  
   Users sign in with their credentials to prove who they are.

2. **Request Access (Authorization)**  
   AWS checks if the user has permission to perform the requested action (e.g., launching an EC2 instance or accessing S3).

3. **Perform Actions**  
   If authorized, the user can take actions based on their permissions.

---

**Summary**: Use IAM to manage users, control permissions, and protect your AWS resources. Keep the root user secure, and set up dedicated identities for day-to-day tasks.

# How to Create Access or an Access Token in AWS

## **1. Access Keys (For CLI/SDK Use)**
Access keys consist of an **Access Key ID** and a **Secret Access Key**. These are used to programmatically interact with AWS.

### Steps to Create Access Keys:
1. **Sign in to the AWS Management Console** as a user with sufficient permissions.
2. Navigate to the **IAM Console**:
    - Open the [IAM Dashboard](https://console.aws.amazon.com/iam/).
3. Select **Users** in the sidebar and choose the user who needs access.
4. Go to the **Security credentials** tab.
5. Click **Create access key** under the "Access keys" section.
6. **Download the credentials** file securely. You won’t see the secret access key again.

---

## **2. Temporary Access Tokens (For Federated/Temporary Access)**
Temporary security credentials include:
- **Access Key ID**
- **Secret Access Key**
- **Session Token**

These are generated via:
- **AWS Security Token Service (STS)** APIs like `AssumeRole` or `GetSessionToken`.

### Steps to Create Temporary Tokens:
1. Use the **`AssumeRole`** API to request temporary credentials:
    - Requires a **Role ARN** and **Session Name**.
    - Example using AWS CLI:
      ```bash
      aws sts assume-role --role-arn "arn:aws:iam::account-id:role/RoleName" --role-session-name "SessionName"
      ```
2. Use the returned **Access Key**, **Secret Key**, and **Session Token** to authenticate.

---

## **3. Personal Access Tokens (For AWS CodeCommit)**
Use these for Git-based interactions with AWS CodeCommit.

### Steps to Create a Personal Access Token:
1. Sign in to the [AWS Management Console](https://aws.amazon.com/console/).
2. Navigate to the **IAM Console**.
3. Select your **IAM user** and open the **Security credentials** tab.
4. In the **HTTPS Git credentials for AWS CodeCommit** section, choose **Generate credentials**.
5. Save the **generated username and password** securely.

---

**Best Practices:**
- Use temporary credentials whenever possible.
- Rotate access keys regularly and avoid hardcoding them.
- Store credentials securely (e.g., AWS Secrets Manager or environment variables).  