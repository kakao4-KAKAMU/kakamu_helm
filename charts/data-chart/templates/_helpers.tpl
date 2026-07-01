{{- define "kakamu-data.pgbouncer.image" -}}
{{- $image := .Values.pgbouncer.image -}}
{{- if $image.digest -}}
{{- printf "%s/%s@%s" $image.registry $image.repository $image.digest -}}
{{- else -}}
{{- printf "%s/%s:%s" $image.registry $image.repository $image.tag -}}
{{- end -}}
{{- end -}}
