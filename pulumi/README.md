Pulumi Evaluation
=================

Cheatsheet
----------

### Create a new pulumi project

```shell
mkdir <project-dir>
cd <project-dir>
pulumi new python -y
```

### Use local backend for state

Run `pulumi login --local` to store states inside of `~/.pulumi`.

### Initialize stack with passphrase secrets provider

```shell
export PULUMI_CONFIG_PASSPHRASE='J%S2LBZ2UFvE$M'
pulumi stack init <stack> --secrets-provider="passphrase"
```

### Restore stack configuration

Run `pulumi config refresh` to create the `Pulumi.<stack>.yaml` files.

### Migrate state backend from cloud to local

```shell
pulumi login
pulumi stack select <stack>
pulumi stack change-secrets-provider "passphrase"
pulumi stack export --file <stack>.stack.json
pulumi logout

pulumi login --local
pulumi stack init <stack>
pulumi stack select <stack>
pulumi stack import --file <stack>.stack.json
```
