# Home Server
A collection of apps that run on my Raspberry Pi at home.

## First-time setup
1. Copy `.env.sample` to `.env` and fill out the values.
2. Optionally edit `config/index.html.template` to your liking.
3. In `config/mosquitto.conf` comment the line `password_file ...`
4. Update firmware on the Zigbee dongle: https://www.zigbee2mqtt.io/guide/adapters/emberznet.html#firmware-flashing
5. In `compose.yml` look for the Zigbee2MQTT Zigbee dongle under `devices` and use the proper one (`ls /dev/serial/by-id`).
6. `sudo docker compose up -d`
7. Enter the Mosquitto container and create passwords for Home Assistant and Zigbee2MQTT:
```
    $ sudo docker exec -it mosquitto /bin/sh
    # mosquitto_passwd -c /mosquitto/config/passwd homeassistant
    # mosquitto_passwd /mosquitto/config/passwd zigbee2mqtt
```
8. Uncomment the line from above in `config/mosquitto.conf`.
9. Bring up Zigbee2MQTT in your browser (zigbee.<domain> or on port 8081) and complete initial configuration. Select the proper Zigbee dongle and enter the credentials created earlier. Use `mqtt://mosquitto:1883` as the MQTT server. 
10. Complete Home Assistant setup in the browser (home.<domain> or on port 8123) and configure the MQTT integration using localhost:1883 and the credentials created in step #4.
