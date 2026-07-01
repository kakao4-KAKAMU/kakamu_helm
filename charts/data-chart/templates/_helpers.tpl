{{- define "kakamu-data.pgbouncer.image" -}}
{{- $image := .Values.pgbouncer.image -}}
{{- $registry := $image.registry | default "docker.io" -}}
{{- if $image.digest -}}
{{- printf "%s/%s@%s" $registry $image.repository $image.digest -}}
{{- else -}}
{{- printf "%s/%s:%s" $registry $image.repository $image.tag -}}
{{- end -}}
{{- end -}}
