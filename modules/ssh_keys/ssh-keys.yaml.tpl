variant: fcos
version: 1.5.0
passwd:
  users:
    - name: core
      ssh_authorized_keys:
%{ for key_path in ssh_key_paths ~}
        - ${file(key_path)}
%{ endfor ~}

