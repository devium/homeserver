# Home Server
A collection of apps that run on my Raspberry Pi at home.

## First-time setup
1. Copy `.env.sample` to `.env` and fill out the values.
2. Copy `config/hetzner.ini.sample` to `config/hetzner.ini` and fill out the API token.
3. Optionally edit `config/index.html.template` to your liking.
4. `sudo docker compose up -d`
5. Enter the Mosquitto container and create passwords for Home Assistant and Zigbee2MQTT:
```
    $ sudo docker exec -it mosquitto /bin/sh
    # mosquitto_passwd -c /mosquitto/config/passwd homeassistant
    # mosquitto_passwd /mosquitto/config/passwd zigbee2mqtt
```
6. Bring up Zigbee2MQTT in your browser (zigbee.<domain> or on port 8081) and complete initial configuration. Select the proper Zigbee dongle and enter the credentials created earlier.
