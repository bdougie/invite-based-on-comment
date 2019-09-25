# Invite collaborator based on a comment
This is an Action that invites collaborators to a team based comment.

## Usage

This actions will check for comments on issues for eight ".invite me" or ".invite @handle".

_**Note:** due to permission limitations for contributors without write access, the default `secrets.GITHUB_TOKEN` cannot be leverage for this action. You will need to provide you by setting your own `GITHUB_TOKEN` environment variable._

```yml
on:
  issue_comment:
    types: [created]
name: A workflow for my Hello World Action

jobs:
  build:
    name: Hello world action
    runs-on: ubuntu-latest # useful environment to we can run a simple bash    
    steps:
    - uses: actions/checkout@master
    - name: hello-world
      uses: bdougie/invite-based-on-comment@master
      env:
        GITHUB_TOKEN: ${{ secrets.BDOUGIE_TOKEN }}
```
