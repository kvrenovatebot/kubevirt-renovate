# kubevirt-renovate
This repo contains PoC renovate config for kubevirt.
Renovate can be triggered via
```
podman run --rm -it -e RENOVATE_TOKEN=$GITHUB_TOKEN -e RENOVATE_REPOSITORIES=dominikholler/kubevirt -e LOG_LEVEL=debug  -e RENOVATE_ALLOWED_POST_UPGRADE_COMMANDS='["make deps-update"]' -e RENOVATE_CONFIG="$(< kubevirt-renovate.json)"  localhost/kubevirt-renovate
```

