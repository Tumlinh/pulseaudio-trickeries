#!/bin/bash

# Unload modules to avoid duplicates
pactl unload-module module-null-sink
pactl unload-module module-loopback
pactl unload-module module-combine-sink

# TODO: configure sinks more precisely (latency, etc.)

# Null sink (multiplexes audio from multiple sinks)
pactl load-module module-null-sink sink_name=null_sink

# Redirect audio input to null sink
pactl load-module module-loopback source=alsa_input.pci-0000_00_1b.0.analog-stereo.echo-cancel sink=null_sink

# Forward input to audio output and null sink
pactl load-module module-combine-sink sink_name=combined_sink slaves=alsa_output.pci-0000_00_1b.0.analog-stereo,null_sink