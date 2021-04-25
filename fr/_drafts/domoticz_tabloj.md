---
lang: fr
lang-niv: fonto
layout: default
lang-ref: domoticz_tabloj
slug: tables domoticz
title: tables domoticz
---

# commandes pour lister les tables

lister les tables : `.tables`

lister la table Hardware : `.schema Hardware`

Créer un catalogue des tables :

```
    create table all_tables as select name from sqlite_master where type='table';  
    create table all_columns as select t.name table_name,x.* from all_tables t, PRAGMA_table_info(t.name) x;
```

# liste des tables :

nom                 | Description|
---|---|
BackupLog|  |
Cameras|  |
CamerasActiveDevices|  |
CustomImages|  |
DeviceStatus| dispositifs (device) |
DeviceToPlansMap|  |
EnoceanSensors|  |
EventMaster| les évènements |
EventRules| les conditions qui déclenchent l'évènement ? Dans le cas d'évènements de type blockly |
Fan|  |
Fan_Calendar|  |
Floorplans|  |
Hardware          | Matèriels |
LightSubDevices|  |
LightingLog|  |
Meter|  |
Meter_Calendar|  |
MobileDevices|  |
MultiMeter|  |
MultiMeter_Calendar|  |
MySensors|  |
MySensorsChilds|  |
MySensorsVars|  |
Notifications|  |
Percentage|  |
Percentage_Calendar|  |
Plans|  |
Preferences|  |
PushLink|  |
Rain|  |
Rain_Calendar|  |
SceneDevices|  |
SceneLog|  |
SceneTimers|  |
Scenes|  |
SetpointTimers|  |
SharedDevices|  |
Temperature| logs temperatures |
Temperature_Calendar|  |
TimerPlans|  |
Timers|  |
ToonDevices|  |
UV|  |
UV_Calendar|  |
UserSessions|  |
UserVariables|  |
Users|  |
WOLNodes|  |
Wind|  |
Wind_Calendar|  |
ZWaveNodes|  |


# table Hardware
description : contient les Matériels

cid|name|type|notnull|dflt_value|pk|description
---|---|
0| *ID* |INTEGER|0||1| identifiant : HardwareId|
1|Name|VARCHAR(200)|1||0
2|Enabled|INTEGER|0|1|0
3|Type|INTEGER|1||0
4|Address|VARCHAR(200)|0||0
5|Port|INTEGER|0||0
6|SerialPort|TEXT|0|''|0
7|Username|VARCHAR(100)|0||0
8|Password|VARCHAR(100)|0||0
9|Extra|TEXT|0|''|0
10|Mode1|CHAR|0|0|0
11|Mode2|CHAR|0|0|0
12|Mode3|CHAR|0|0|0
13|Mode4|CHAR|0|0|0
14|Mode5|CHAR|0|0|0
15|Mode6|CHAR|0|0|0
16|DataTimeout|INTEGER|0|0|0
17|Configuration|TEXT|0|''|0
18|LogLevel|INTEGER|0|7|0

# table DeviceStatus
description : contient les dispositifs

cid|name|type|notnull|dflt_value|pk|description
---|---|
0| *ID* |INTEGER|0||1| identifiant.|
1|HardwareID|INTEGER|1||0| le matèriel qui le gère= Hardware.Id |
2|DeviceID|VARCHAR(25)|1||0| son identifiant pour le matèriel |
3|Unit|INTEGER|0|0|0| son numéro d'unité |
4|Name|VARCHAR(100)|0|Unknown|0| x Nom |
5|Used|INTEGER|0|0|0| x Utilisé (0/1)
6|Type|INTEGER|1||0
7|SubType|INTEGER|1||0
8|SwitchType|INTEGER|0|0|0
9|Favorite|INTEGER|0|0|0| x Favori (0/1)
10|SignalLevel|INTEGER|0|0|0
11|BatteryLevel|INTEGER|0|0|0
12|nValue|INTEGER|0|0|0
13|sValue|VARCHAR(200)|0|null|0
14|LastUpdate|DATETIME|0|datetime('now','localtime')|0
15|Order|INTEGER BIGINT(10)|0|0|0
16|AddjValue|FLOAT|0|0|0| x
17|AddjMulti|FLOAT|0|1|0| x
18|AddjValue2|FLOAT|0|0|0| x
19|AddjMulti2|FLOAT|0|1|0| x
20|StrParam1|VARCHAR(200)|0|''|0
21|StrParam2|VARCHAR(200)|0|''|0
22|LastLevel|INTEGER|0|0|0
23|Protected|INTEGER|0|0|0
24|CustomImage|INTEGER|0|0|0| x?
25|Description|VARCHAR(200)|0|''|0| x
26|Options|TEXT|0|null|0|
27|Color|TEXT|0|NULL|0| x?

