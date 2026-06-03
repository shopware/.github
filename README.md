# Shopware Community Health Files & Organization Configuration

This .github repository contains the [default community health files](https://help.github.com/en/articles/creating-a-default-community-health-file-for-your-organization), organization-wide policies, and [organization profile README.md](./profile/README.md) used across all Shopware GitHub repositories. It helps standardize contributing, security, and behavioral guidelines for everyone collaborating within the Shopware organization.

## What’s Included

- **Default Community Health Files**
  Templates for essential community files, such as:
  - CONTRIBUTING.md (contribution guidelines)
  - CODE_OF_CONDUCT.md (code of conduct for all participants)
  - SECURITY.md (security reporting instructions)
  - ISSUE_TEMPLATEs (templates for bug reports and feature requests)
  - PULL_REQUEST_TEMPLATE.md (guidelines for PR submissions)
- **Organization Profile README**
  The public-facing introduction and description for the GitHub organization.
- **Octo-STs Organization-wide Policies**
  Enforced settings and security policies applied to all repositories within the Shopware organization.

## Purpose

- Ensure a **consistent, open, and welcoming environment** for all contributors.
- Provide **clear guidelines** for contributing, reporting issues, and responsible disclosure/security.
- Save time for maintainers by providing unified templates and best practices.
- Ensure high project and community standards throughout all Shopware codebases.

## Guidelines for octo-sts
### Here are some Guidelines for using octo-sts
1. If your repo needs access to multiple repos in the same token then you should create a policy here.
2. If your repo just needs access to a single repo then you should create a policy in the targeted repo.
3. If your repo needs access to multiple repos, but those names shouldn't be public. You could either create a policy in the target repos and request multi octo-sts tokens or ask the product-operations team if they can create a PAT for you.
4. If you need cross organization access, you either need octo-sts in the other organizations too or request a PAT.

### Some Examples when to use which Option
1. You want to trigger a downstream on two repos from another repo or you need to pull multiple private packages from other repos.
2. You want to create a PR in another repo.
3. You build a new app that isn't public yet.
4. You want to pull code from an private shopwareLabs repo.

### Example policies
[Allow triggering Downstream from shopware repo (Organization wide)](./.github/chainguard/ShopwareDownstream.sts.yaml)
[Allow triggering a workflow from shopware repo (Repo scoped)](https://github.com/shopware/template/blob/trunk/.github/chainguard/release.sts.yaml)

### Additional Infos
- [Official octo-sts documentation](https://github.com/octo-sts/app)
- [YAML Schema for policies](https://raw.githubusercontent.com/octo-sts/app/refs/heads/main/pkg/octosts/octosts.TrustPolicy.json)

## Contribution

To contribute or suggest improvements to our community health files and policies:

1. Fork this repository.
2. Create a feature branch with your changes.
3. Open a pull request for review by Shopware maintainers.

> **Note:** Changes here may affect every Shopware repository. Please discuss larger improvements via GitHub issues first.
