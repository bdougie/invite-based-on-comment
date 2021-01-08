# Invite collaborator based on a comment
This is an Action that invites collaborators to a team based comment.

## Usage

This actions will check for comments on issues for eight ".invite me" or ".invite @handle". You can set SELF_INVITE to false to disable ".invite me" checks ( defaults to true )

An ORG name and Team Id is needed. You can find your Team Id by using curl.

```sh
curl -H "Authorization: token <very-long-access-token>" https://api.github.com/orgs/<org-name>/teams
```

_**Note:** due to permission limitations for contributors without write access, the default `secrets.GITHUB_TOKEN` cannot be leveraged for this action. You will need to provide your own GitHub token to the `GITHUB_TOKEN` environment variable._

```yml
on:
  issue_comment:
    types: [created]
name: Invite a new collaborator

jobs:
  build:
    name: Invite contributor to the Org
    runs-on: ubuntu-latest     
    steps:
    - uses: actions/checkout@master
    - name: invite-contributor
      uses: bdougie/invite-based-on-comment@master
      env:
        GITHUB_TOKEN: ${{ secrets.BDOUGIE_TOKEN }}
        TEAM_ID: 123456
        ORG: 'github-craftwork'
        SELF_INVITE: true 
```
