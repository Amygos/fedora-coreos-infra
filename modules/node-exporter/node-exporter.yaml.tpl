variant: fcos
version: 1.5.0
storage:
  files:
    - path: /etc/containers/systemd/node-exporter.container
      contents:
        inline: |
          [Unit]
          Description=node-exporter
          Wants=network-online.target
          After=network-online.target

          [Container]
          Image=docker.io/prom/node-exporter:v1.8.1
          Network=host
          Volume=/:/host:ro,rslave
          PodmanArgs=--pid=host
          Exec=--path.rootfs=/host --web.listen-address=127.0.0.1:9100 --web.telemetry-path=/${telemetry-path}

          [Install]
          WantedBy=multi-user.target
