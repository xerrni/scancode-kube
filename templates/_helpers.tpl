{{/*
Expand the name of the chart.
*/}}
{{- define "scancodeio.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "scancodeio.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "scancodeio.scancode-database" -}}
{{- if .Values.scancodeDatabase }}
{{- .Values.scancodeDatabase | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "scancode-db" }}
{{- end }}
{{- end }}

{{- define "scancodeio.scancode-username" -}}
{{- if .Values.scancodeUsername }}
{{- .Values.scancodeUsername | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "scancode-user" }}
{{- end }}
{{- end }}

{{- define "scancodeio.scancode-password" -}}
{{- if .Values.scancodePassword }}
{{- .Values.scancodePassword | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- randAlphaNum 32 | b64enc | quote }}
{{- end }}
{{- end }}

{{- define "scancodeio.scancode-postgres-password" -}}
{{- if .Values.scancodePostgresPassword }}
{{- .Values.scancodePostgresPassword | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- randAlphaNum 32 | b64enc | quote }}
{{- end }}
{{- end }}

{{- define "scancodeio.scancode-SECRET_KEY" -}}
{{- if .Values.scancodeSECRET_KEY }}
{{- .Values.scancodeSECRET_KEY | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- randAlphaNum 32 | b64enc | quote }}
{{- end }}
{{- end }}

{{- define "scancodeio.scancode-SCANCODEIO_REDIS_PASSWORD" -}}
{{- if .Values.scancodeSCANCODEIO_REDIS_PASSWORD }}
{{- .Values.scancodeSCANCODEIO_REDIS_PASSWORD | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- randAlphaNum 32 | b64enc | quote }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "scancodeio.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "scancodeio.labels" -}}
helm.sh/chart: {{ include "scancodeio.chart" . }}
{{ include "scancodeio.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "scancodeio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "scancodeio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "scancodeio.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "scancodeio.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
