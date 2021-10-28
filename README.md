# Обновляем\даунгрейд OpenWRT на шлюзе Xiaomi DGNWG05LM
-------
__Владельцам шлюза Aqara ZHWG11LM [сюда](https://github.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm)__

--------
Выражаю благодарность [Ivan Belokobylskiy](https://github.com/devbis) и [mr G1K](https://github.com/G1K) за помощь в обновлении и даунгрейде OpenWRT. 


**Проект Open Lumi Gateway**

https://github.com/openlumi

**Исходники**

1) https://openlumi.github.io/releases/

2) https://github.com/openlumi/releases/tree/2b87c8a6a5610e238b5b9748b8e461790c7c7919


**Release of OpenWrt 21.02.0 for Xiaomi DGNWG05LM and Aqara ZHWG11LM**

https://github.com/openlumi/openwrt/releases

**Группа Xiaomi Gateway hack в телеграм**

https://t.me/xiaomi_gw_hack

Для удобства я создал скрипты, которые помогут вам обновить OpenWRT с версии 19.07 до 21.02 или сделать даунгрейд OpenWRT с версии 21.02 до 19.07. После того, как скрипт отработает, то шлюз перезагрузится и ждем, когда поднимется точка доступа с именем OpenWRT. Настройте подключение к роутеру WiFi.

**Внимание! Перед запуском скрипта, обязательно сделайте резервную копию шлюза**

**Шлюз Xiaomi DGNWG05LM**

Обновляем OpenWRT с версии 19.07 до 21.02
```
wget https://raw.githubusercontent.com/DivanX10/Openwrt-scripts-for-gateway-dgnwg05lm/main/scripts/xiaomi_dgnwg05lm_update_openwrt_21.sh -O - | sh
```
Даунгрейд OpenWRT с версии 21.02 до 19.07
```
wget https://raw.githubusercontent.com/DivanX10/Openwrt-scripts-for-gateway-dgnwg05lm/main/scripts/xiaomi_dgnwg05lm_downgrade_openwrt_19.sh -O - | sh
```
----
__Полный бэкап вручную, через консоль__

Бэкап будет лежать в папке /tmp
```
tar cvz -f /tmp/backup_$(date +%d-%m-20%y_%H-%M).tar.gz -C /overlay/upper/ /overlay/upper/
```
__Удаление всех файлов и сброс шлюза к заводским настройкам__
```
rm -rf /overlay/upper/.* /overlay/upper/* && reboot
```


