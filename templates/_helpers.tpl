{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 24 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trimSuffix "-app" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "appname" -}}
{{- $releaseName := default .Release.Name .Values.releaseOverride -}}
{{- printf "%s" $releaseName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "imagename" -}}
{{- if eq .Values.image.tag "" -}}
{{- .Values.image.repository -}}
{{- else -}}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag -}}
{{- end -}}
{{- end -}}

{{- define "trackableappname" -}}
{{- $trackableName := printf "%s-%s" (include "appname" .) .Values.application.track -}}
{{- $trackableName | trimSuffix "-stable" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Get a hostname from URL
*/}}
{{- define "hostname" -}}
{{- . | trimPrefix "http://" |  trimPrefix "https://" | trimSuffix "/" | quote -}}
{{- end -}}

{{/*
Get SecRule's arguments with unescaped single&double quotes
*/}}
{{- define "secrule" -}}
{{- $operator := .operator | quote | replace "\"" "\\\"" | replace "'" "\\'" -}}
{{- $action := .action | quote | replace "\"" "\\\"" | replace "'" "\\'" -}}
{{- printf "SecRule %s %s %s" .variable $operator $action -}}
{{- end -}}