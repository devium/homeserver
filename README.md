# Home Server
A collection of apps that run on my Raspberry Pi at home.

## First-time setup
1. Copy `.env.sample` to `.env` and fill out the values.
2. Optionally edit `config/index.html.template` to your liking.
3. `sudo docker compose up -d`
4. Enter the Mosquitto container and create passwords for Home Assistant and Zigbee2MQTT:
```
    $ sudo docker exec -it mosquitto /bin/sh
    # mosquitto_passwd -c /mosquitto/config/passwd homeassistant
    # mosquitto_passwd /mosquitto/config/passwd zigbee2mqtt
```
5. Bring up Zigbee2MQTT in your browser (zigbee.<domain> or on port 8081) and complete initial configuration. Select the proper Zigbee dongle and enter the credentials created earlier.
6. Complete Home Assistant setup in the browser (home.<domain> or on port 8123) and configure the MQTT integration using localhost:1883 and the credentials created in step #4.
