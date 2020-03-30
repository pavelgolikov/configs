#!/bin/sh

id=$(xinput | grep VEIKK | grep pointer | awk '{print $5}' | cut -c4-6)

xinput map-to-output $id HDMI-A-0
