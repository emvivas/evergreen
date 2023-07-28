use evergreen;
CALL registerMeasurement(@id, "latitude", '°');
CALL registerMeasurement(@id, "longitude", '°');
CALL registerMeasurement(@id, "altitude", "mbsl");

CALL registerMeasurement(@id, "humidity", "units");
CALL registerMeasurement(@id, "humidity percentage", '%');

CALL registerMeasurement(@id, "brightness", "units");
CALL registerMeasurement(@id, "brightness percentage", '%');

CALL registerMeasurement(@id, "temperature", "°C");
CALL registerMeasurement(@id, "temperature percentage", '%');

CALL registerMeasurement(@id, "atmospheric pressure", "Pa");

SELECT * FROM Measurement;

CALL registerPotPlant(@id, "ExpoTECDec2022PE", "ExpoTEC Dec2022 PotPlant", "1.0.0b", "Maceta inteligente premium EverGreen edición ExpoTEC Diciembre 2022", "La maceta incluye 5 sensores electrónicos, un panel LED y baterías", "PLA-F", "FFFFFF", "smooth");
SELECT * FROM PotPlant;

CALL registerModule(@id, "DHT11", "Sensor DHT11", "ASAIR", "AOSONG", NULL, "Sensor de humedad y temperatura relativa");
CALL registerModule(@id, "YL-69", "Sensor YL-69", NULL, NULL, NULL, "Sensor de humedad en superficie");
CALL registerModule(@id, "TM-76", "Sensor LDR TM-76", "TM", "TM-76", NULL, "Sensor LDR de luminosidad");
CALL registerModule(@id, "NEO-6M V2", "Módulo NEO-6M V2", "Tecneu", "NEO-6M", '2', "Módulo de GPS");
CALL registerModule(@id, "DMDR LED8x8", "Pantalla DMDR LED8x8", "Rantec Electronics", NULL, NULL, "Pantalla matriz LED Rojo 8x8");
CALL registerModule(@id, "MICRO-SWPUMP", "Bomba de agua MICRO-SWPUMP", "Steren", NULL, NULL, "Micro bomba de agua con flujo 80 a 120 l/h");
CALL registerModule(@id, "NODEMCU V2 ESP8266 WIFI", "Módulo NODEMCU V2 ESP8266 WIFI", "Amica", NULL, '2', "Tarjeta de circuitos integrados para desarrollo IoT");
SELECT * FROM Module;

CALL registerImplementation(@id, NULL, 1, 1);
CALL registerImplementation(@id, NULL, 1, 2);
CALL registerImplementation(@id, NULL, 1, 3);
CALL registerImplementation(@id, NULL, 1, 4);
CALL registerImplementation(@id, NULL, 1, 5);
CALL registerImplementation(@id, NULL, 1, 6);
CALL registerImplementation(@id, NULL, 1, 7);
SELECT * FROM Implementation;

CALL registerMonitoring(@id, NULL, 1, 4);
CALL registerMonitoring(@id, NULL, 1, 5);
CALL registerMonitoring(@id, NULL, 1, 8);
CALL registerMonitoring(@id, NULL, 1, 9);
CALL registerMonitoring(@id, NULL, 2, 4);
CALL registerMonitoring(@id, NULL, 2, 5);
CALL registerMonitoring(@id, NULL, 3, 6);
CALL registerMonitoring(@id, NULL, 3, 7);
CALL registerMonitoring(@id, NULL, 4, 1);
CALL registerMonitoring(@id, NULL, 4, 2);
CALL registerMonitoring(@id, NULL, 4, 3);
SELECT * FROM Monitoring AS mo JOIN Measurement AS me ON mo.Measurement_identificator = me.identificator;

CALL registerPotPlantUnit(@id, "ExpoTECIoT2022", 1);
delete from graphic where identificator > 0;
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=18&refresh=5s", 1, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/expoteciot2022?orgId=1&from=1670341108000&to=1670341856000&theme=light&panelId=40&refresh=10s", 2, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=19&refresh=5s", 3, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/expoteciot2022?orgId=1&from=1670341108000&to=1670341856000&theme=light&panelId=28&refresh=10s", 4, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&refresh=10s&from=1669694012607&to=1669737212609&theme=light&panelId=30&refresh=5s", 5, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/expoteciot2022?orgId=1&from=1670341108000&to=1670341856000&theme=light&panelId=34&refresh=10s", 6, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=17&refresh=5s", 7, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/expoteciot2022?orgId=1&from=1670341108000&to=1670341856000&theme=light&panelId=39&refresh=10s", 8, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=20&refresh=15s", 9, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=8&refresh=5s", 10, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=24&refresh=5s", 11, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=22&refresh=15s", 12, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=9&refresh=5s", 13, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=23&refresh=5s", 14, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?from=1669950367000&to=1669950502000&refresh=10s&orgId=1&theme=light&panelId=35&refresh=15s", 15, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?from=1669950367000&to=1669950502000&refresh=10s&orgId=1&theme=light&panelId=29&refresh=5s", 16, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?from=1669950367000&to=1669950502000&refresh=10s&orgId=1&theme=light&panelId=36&refresh=5s", 17, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=21&refresh=15s", 18, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=13&refresh=5s", 19, 1);
CALL registerGraphic(@id, "http://localhost:8080/d-solo/nmVhJGFVz/luz?orgId=1&from=1669694012607&to=1669737212609&theme=light&panelId=25&refresh=5s", 20, 1);
CALL registerPotPlantUnit(@id, "ExpoTECIoT20225", 1);
CALL registerPotPlantUnit(@id, "ExpoTECIoT20227", 1);
CALL registerPotPlantUnit(@id, "ExpoTECIoT20228", 1);

CALL registerTrasplantation(@id, "Maruchan", 0.2, "De camarón porque si no, no", 2, 1);

SELECT * FROM PotPlantUnit;

CALL registerPlant(@id, "Flor de pascua", "Se utiliza frecuentemente en jardinería como arbusto, pero principalmente en floricultura como planta de interior en Navidad", "f30304", NULL, "Plantae", "Magnoliophyta", "Magnoliopsida", "Malpighiales", "Euphorbiaceae", "Euphorbieae", "Euphorbieae pulcherrima", 1, 1);
SELECT * FROM Plant;
select * from potplant;

-- CALL registerPlot(@id, "ExpoTECIoT2022", 1);
SELECT * FROM acquisition;

SELECT * FROM trasplantation;
SELECT * FROM user;

SELECT obs.register AS "Tiempo", obs.value AS "Valor" FROM evergreen.observation AS obs INNER JOIN evergreen.monitoring AS mon ON obs.Monitoring_identificator = mon.identificator INNER JOIN evergreen.implementation AS imp ON mon.Implementation_identificator = imp.identificator INNER JOIN evergreen.Module AS modu ON imp.Module_identificator = modu.identificator WHERE obs.Monitoring_identificator=1 AND modu.identificator = 1 AND obs.Trasplantation_identificator=3;

SELECT tra.identificator, tra.name, tra.age, tra.notes, tra.register, tra.updateRow, IFNULL(pla.denomination, '') AS "denomination", IFNULL(pla.description, '') AS "description", IFNULL(pla.color, "000000") AS "color", pla.age AS "agePlant", IFNULL(pla.kingdom, '') AS "kingdom", IFNULL(pla.phylum, '') AS "phylum", IFNULL(pla.class, '') AS "class", IFNULL(pla.orders, '') AS "orders", IFNULL(pla.family, '') AS "family", IFNULL(pla.genus, '') AS "genus", IFNULL(pla.species, '') AS "species", pla.country, pla.exotic, acq.register AS "registerAcquisition", ppu.code, pot.code AS "codePot", pot.denomination AS "denominationPot", pot.version, pot.description AS "descriptionPot", pot.properties, pot.material, IFNULL(pot.color, "000000") AS "colorPot", pot.texture FROM Acquisition AS acq INNER JOIN Trasplantation AS tra ON acq.identificator = tra.Acquisition_identificator LEFT JOIN Plant AS pla ON tra.Plant_identificator = pla.identificator INNER JOIN PotPlantUnit AS ppu ON acq.PotPlantUnit_identificator = ppu.identificator INNER JOIN PotPlant AS pot ON ppu.PotPlant_identificator = pot.identificator WHERE tra.identificator = 1 AND pot.status = 1 AND ppu.status = 1 AND acq.status = 1 AND tra.status = 1 LIMIT 1;

drop database evergreen;
select * from observation;
SELECT * FROM trasplantation;
select * from graphic;
CALL selectTrasplantation(1, 1);
SELECT tra.identificator, tra.name, tra.age, tra.notes, tra.register, tra.updateRow from trasplantation as tra;

SELECT tra.identificator, tra.name, tra.age, tra.notes, tra.register, tra.updateRow, IFNULL(pla.denomination, '') AS "denomination", IFNULL(pla.description, '') AS "description", IFNULL(pla.color, "000000") AS "color", pla.age AS "agePlant", IFNULL(pla.kingdom, '') AS "kingdom", IFNULL(pla.phylum, '') AS "phylum", IFNULL(pla.class, '') AS "class", IFNULL(pla.orders, '') AS "orders", IFNULL(pla.family, '') AS "family", IFNULL(pla.genus, '') AS "genus", IFNULL(pla.species, '') AS "species", pla.country, IF(pla.exotic=1, 1, 0) AS "exotic", acq.register AS "registerAcquisition", ppu.code, pot.code AS "codePot", pot.denomination AS "denominationPot", pot.version, pot.description AS "descriptionPot", pot.properties, pot.material, IFNULL(pot.color, "000000") AS "colorPot", pot.texture, obs.ipv4 FROM Acquisition AS acq INNER JOIN Trasplantation AS tra ON acq.identificator = tra.Acquisition_identificator INNER JOIN Observation AS obs ON tra.identificator = obs.Trasplantation_identificator LEFT JOIN Plant AS pla ON tra.Plant_identificator = pla.identificator INNER JOIN PotPlantUnit AS ppu ON acq.PotPlantUnit_identificator = ppu.identificator INNER JOIN PotPlant AS pot ON ppu.PotPlant_identificator = pot.identificator WHERE acq.User_identificator = 1 AND tra.identificator = 1 AND pot.status = 1 AND ppu.status = 1 AND acq.status = 1 LIMIT 1;

call selectTrasplantation(1, 1);
