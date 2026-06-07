{{- define "neo4j-chart.postgresqlPassword" -}}
{{- $password := "" -}}
{{- if .Values.postgresql.existingSecret -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace .Values.postgresql.existingSecret -}}
{{- if $secret -}}
{{- $password = index $secret.data .Values.postgresql.passwordKey | b64dec -}}
{{- end -}}
{{- end -}}
{{- if not $password -}}
{{- $password = .Values.postgresql.password -}}
{{- end -}}
{{- $password -}}
{{- end -}}

{{- define "neo4j-chart.apocJdbcUrl" -}}
{{- $password := include "neo4j-chart.postgresqlPassword" . -}}
{{- printf "jdbc:postgresql://%s:%v/%s?user=%s&password=%s" .Values.postgresql.host .Values.postgresql.port .Values.postgresql.database .Values.postgresql.user $password -}}
{{- end -}}
