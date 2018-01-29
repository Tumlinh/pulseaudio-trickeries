# PulseAudio trickeries
PulseAudio trick for multiplexing audio inputs from multiple sources and forwarding them to another application.

You can use it for talking on Mumble while broadcasting music to everybody.

---

### How to
+ Install `pavucontrol`
+ Execute `pulseaudio-trickeries.sh`
+ Launch a music player and a sound recorder app, for example VLC and Audacity
+ Run `pavucontrol`
  + 'Playback' tab &rarr; VLC &rarr; 'Simultaneous output to *, Null Output'
  + 'Recording' tab &rarr; Audacity &rarr; 'Monitor of Null Output'
    + requires to start recording first

### How it works
```
                                   +---> Audio output
Audio input #1 ---> Combined sink -+
(music player)                     +---> Null sink ---> Recording app
                                             ^            (Mumble)
                                             |
Audio input #2 ------------------------------+
(microphone)
```

### References
https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Modules