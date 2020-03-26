# apm-action

A GitHub action to setup Atom package manager and publish packages.

## Usage

Create a file `.github/workflows/apm-publish.yml`:

``` yml
---
name: apm-publish

on:
  create:
    tags:
      - 'v*'

jobs:
  apm-publish:
    runs-on: ubuntu-latest
    steps:
    - name: Get tag name
      id: get_tag_name
      run: echo ::set-output name=TAG_NAME::${GITHUB_REF/refs\/tags\//}
    - name: Checkout code
      uses: actions/checkout@master
      with:
        ref: ${{ steps.get_tag_name.outputs.TAG_NAME }}
    - name: Publish extension
      uses: tzvetkoff/apm-action@master
      with:
        args: apm publish -t ${{ steps.get_tag_name.outputs.TAG_NAME }}
      env:
        ATOM_ACCESS_TOKEN: ${{ secrets.ATOM_ACCESS_TOKEN }}
```

## Secrets

| Secret              | Description                                                                                |
| ------------------- | ------------------------------------------------------------------------------------------ |
| `ATOM_ACCESS_TOKEN` | Atom package registry API token. Get it from [your account page](https://atom.io/account). |
