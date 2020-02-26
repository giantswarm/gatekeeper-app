[![CircleCI](https://circleci.com/gh/giantswarm/gatekeeper-app.svg?style=shield&circle-token=7552290f91277c20801ee5bf7ff8c754a9f59d6d)](https://circleci.com/gh/giantswarm/gatekeeper-app)

# gatekeeper-app chart

Giant Swarm offers a Gatekeeper Managed App which can be installed in tenant clusters.
Here we define the Gatekeeper chart with its templates and default configuration.

## Release new version

* create a PR to update changelog, see https://github.com/giantswarm/gatekeeper-app/pull/18/files#diff-4ac32a78649ca5bdd8e0ba38b7006a1e
* create a release via https://github.com/giantswarm/gatekeeper-app/releases/new
* ci will do its job and deploy this to installations

## Development

How to install gatekeeper into a tenant cluster

```
$ git clone git@github.com:giantswarm/gatekeeper-app.git
$ cd gatekeeper-app
$ sed 's#\[\[ .Version \]\]#$(architect project version)#' ./helm/gatekeeper-app/Chart.yaml
$ helm --kube-context=giantswarm-z80tk --tiller-namespace=giantswarm install --name gatekeeper ./helm/gatekeeper-app
```

## Sync chart with upstream

In order sync this gatekeeper chart with the upstream repository, you can use the script at [`script/sync_chart.sh`](script/sync_chart.sh)

Output example:

```
$ ./script/sync_chart.sh
=====> fetching upstream chart
Cloning into '/var/folders/g0/z1wf7ry91lbcct5ghd7vwvgm0000gn/T/tmp.j8R9dpMP'...
remote: Enumerating objects: 10278, done.
remote: Total 10278 (delta 0), reused 0 (delta 0), pack-reused 10278
Receiving objects: 100% (10278/10278), 25.13 MiB | 13.78 MiB/s, done.
Resolving deltas: 100% (4821/4821), done.
=====> syncing chart
building file list ... done
./
values.yaml
templates/
templates/_helpers.tpl
templates/gatekeeper.yaml

sent 17077 bytes  received 98 bytes  34350.00 bytes/sec
total size is 16770  speedup is 0.98
=====> patching chart
patching file templates/gatekeeper.yaml
patching file templates/gatekeeper.yaml
=====> done
```

If for any reason you need to make changes to the upstream chart please create a patch file and store it in the [`patch`](patch) directory. This will help us track which changes we make to the upstream repository and make the review process easier as we only need to review the patches files rather than the entire chart changes.

To create a patch, first run the sync script then make changes to the chart and write the patch using:

```
$ git -C helm/gatekeeper-app diff --relative |tee patch/XX.foo.patch
diff --git a/templates/gatekeeper.yaml b/templates/gatekeeper.yaml
index c80b26f..592fca0 100644
--- a/templates/gatekeeper.yaml
+++ b/templates/gatekeeper.yaml
@@ -11,6 +11,7 @@ metadata:
     chart: '{{ template "gatekeeper-operator.name" . }}'
     heritage: '{{ .Release.Service }}'
     release: '{{ .Release.Name }}'
+    foo: bar
   name: configs.config.gatekeeper.sh
 spec:
   group: config.gatekeeper.sh
```

Where XX is the next patch number, because patch files need to be ordered from oldest to newest.

## Credit

* [Upstream Repository](https://github.com/open-policy-agent/gatekeeper)
