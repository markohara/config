# config

Used to provision a mac with my application stack

```
./setup
```

to update brew applications;

```
./brew/update
```

### Manual Steps

Enable accessibility control, follow on screen instructions, then stop the service.
1. [Yabai](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release))
    ``` yabai --start-service ```
    ``` yabai --stop-service ```
2. [SKHD](https://github.com/koekeishiya/skhd)
    ``` skhd --start-service ```
    ``` skhd --stop-service ```