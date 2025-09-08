{{/*
Image used by the container.
*/}}
{{- define "bjw-s.common.lib.container.field.image" -}}
  {{- $ctx := .ctx -}}
  {{- $rootContext := $ctx.rootContext -}}
  {{- $containerObject := $ctx.containerObject -}}

  {{- $imageRepo := $containerObject.image.repository -}}
  {{- $imageTag := $containerObject.image.tag -}}

  {{- /* Normalize and render templates inside repository */ -}}
  {{- if $imageRepo -}}
    {{- if kindIs "float64" $imageRepo -}}
      {{- $imageRepo = $imageRepo | toString -}}
    {{- end -}}
    {{- $imageRepo = tpl $imageRepo $rootContext -}}
  {{- end -}}

  {{- if and $imageRepo $imageTag -}}
    {{- printf "%s:%s" $imageRepo $imageTag -}}
  {{- end -}}
{{- end -}}
