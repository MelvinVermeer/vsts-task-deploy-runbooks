Before building or publishing read the [docs](https://docs.microsoft.com/en-us/vsts/extend/publish/overview).

to aquire tooling type `npm install -g tfx-cli`

to get personal access token the [ms docs](https://docs.microsoft.com/en-us/vsts/accounts/use-personal-access-tokens-to-authenticate?view=vsts)

to publish execute
```
tfx extension publish --manifest-globs vss-extension.json --share-with <vsts account> --rev-version --token <your access token> 
```