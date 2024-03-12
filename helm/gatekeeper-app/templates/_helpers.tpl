{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "gatekeeper-operator.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "gatekeeper-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "gatekeeper-operator.labels" -}}
{{ include "gatekeeper-operator.selectorLabels" . }}
app: {{ include "gatekeeper-operator.name" . | quote }}
application.giantswarm.io/branch: {{ .Values.project.branch | quote }}
application.giantswarm.io/commit: {{ .Values.project.commit | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ include "gatekeeper-operator.chart" . | quote }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "gatekeeper-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gatekeeper-operator.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}

{{/*
Monitoring selector labels

These enable the service to be monitored by the new Giant Swarm Prometheus
when applied to a service.
*/}}
{{- define "monitoringLabels" -}}
giantswarm.io/monitoring: "true"
{{- end -}}

{{/*
Monitoring configuration annotations

These enable and configure monitoring of the app when applied to a service.
*/}}
{{- define "monitoringConfigurationAnnotations" -}}
prometheus.io/scrape: "true"
prometheus.io/port: "8888"
giantswarm.io/monitoring-port: "8888"
{{- end -}}
