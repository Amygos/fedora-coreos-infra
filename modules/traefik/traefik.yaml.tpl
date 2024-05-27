variant: fcos
version: 1.5.0
storage:
  files:
    - path: /etc/containers/systemd/traefik.container
      contents:
        inline: |
          [Container]
          Image=docker.io/traefik:3.0.1
          ContainerName=traefik
          Network=host
          Volume=/etc/traefik/traefik.yml:/etc/traefik/traefik.yml:ro,Z
          Volume=/etc/traefik/conf.d:/etc/traefik/conf.d:ro,Z
          Volume=traefik_certificates.volume:/certificates

          [Install]
          WantedBy=default.target
    - path: /etc/containers/systemd/traefik_certificates.volume
      contents:
        inline: |
          [Volume]
    - path: /etc/traefik/traefik.yml
      contents:
        inline: |
          entryPoints:
            web:
              address: ":80"
            websecure:
              address: ":443"
          providers:
            file:
              directory: /etc/traefik/conf.d
              watch: true
          ping:
            manualRouting: true
          certificatesResolvers:
            letsencrypt:
              acme:
                email: "your-email@example.com"
                storage: /certificates/acme.json
                tlsChallenge: {}
    - path: /etc/traefik/conf.d/dynamic_config.yaml
      contents:
        inline: |
          ${indent(10,yamlencode(dynamic_config))}
