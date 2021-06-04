{{/*
Expand the name of the chart.
*/}}
{{- define "lazy-stock-screener.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}