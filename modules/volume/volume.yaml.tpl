variant: fcos
version: 1.5.0
storage:
  filesystems:
    - path: ${mountpoint}
      device: /dev/disk/by-label/${label}
      # We can select the filesystem we'd like.
      format: xfs
      # Ask Butane to generate a mount unit for us so that this filesystem
      # gets mounted in the real root.
      with_mount_unit: true
systemd:
  units:
    - name: ${label}-growfs.service
      enabled: true
      contents: |
        [Unit]
        Description=Grow the volume filesystem
        After=${label}.mount
        ConditionPathExists=!/var/lib/%N-${size}.stamp

        [Service]
        Type=oneshot
        RemainAfterExit=yes
        ExecStart=/usr/sbin/xfs_growfs ${mountpoint}
        ExecStart=/bin/touch /var/lib/%N.stamp

        [Install]
        WantedBy=multi-user.target
