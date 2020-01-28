[![CircleCI](https://circleci.com/gh/giantswarm/gatekeeper-app.svg?style=shield&circle-token=7552290f91277c20801ee5bf7ff8c754a9f59d6d)](https://circleci.com/gh/giantswarm/gatekeeper-app)

# gatekeeper-app chart

Giant Swarm offers a Gatekeeper Managed App which can be installed in tenant clusters.
Here we define the Gatekeeper chart with its templates and default configuration.

## Development

How to install gatekeeper into a tenant cluster

```
$ GITHUB_TOKEN=<your github token> # created at https://github.com/settings/token
$ BRANCH=master
$ helm --tiller-namespace=giantswarm install https://giantswarm.github.io/giantswarm-incubator-test-catalog/gatekeeper-app-0.0.0-$(curl -sSH "Authorization: token $(cat ~/secrets/theo/github.com-token)" https://api.github.com/repos/giantswarm/gatekeeper-app/commits/$BRANCH|jq -r .sha).tgz --name gatekeeper
```

## Credit

* [Upstream Repository](https://github.com/open-policy-agent/gatekeeper)
