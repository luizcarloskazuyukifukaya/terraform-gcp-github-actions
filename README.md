# terraform-gcp-github-actions
Automating Terraform Deployment to Google Cloud with GitHub Actions

For details terraforming steps [please refer the blog](https://medium.com/@vikramshinde/automating-terraform-deployment-to-google-cloud-with-github-actions-17516c4fb2e5)

## Actions secrets
There is a secrets refered by the GitHub Actions workflow, which should not be exposed into the repository source code itself, and the following explains more about how those secrets are to be managed.

Creating configuration variables for a repository

For example, ${{ secrets.GOOGLE_CREDENTIALS }} is the expression in the workflow YAML to refer to the secrets configured in the GitHub.com repository settings.

The [blog](https://medium.com/@vikramshinde/automating-terraform-deployment-to-google-cloud-with-github-actions-17516c4fb2e5) explain how you can extract the JSON multi-line to a single line so you can copy that value to define the secrets value directly on GitHub.com repository settings.

```shell
vi SA_key.json
press :
%s;\n; ;g
Press enter.
press : again
type wq!
```

## Steps to add secrets on the repository
1. Go to the repository top and select "settings"
2. On the left bar, select ""Secrets and variables"
3. Click "Actions"
4. Select "New repository secret"
5. "Actions secrets / New secret" appears
6. Input "Name" (Secret Name) and "Secret" (Value)
7. Select "Add secret"

(NOTE) The Secret Name defined can be used in the workflow as ${{
secrets.[Secret Name] }}

The workflow step should like this:
```
  - name: Terraform Init
    run: terraform init
    env:
      GOOGLE_CREDENTIALS: ${{ secrets.GOOGLE_CREDENTIALS }}
```

(NOTE) The Secret Name is defined as "GOOGLE_CREDENTIALS" for the above example
in the repository settings.

