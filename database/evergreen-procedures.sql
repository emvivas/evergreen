
DELIMITER //
CREATE PROCEDURE registerUser(OUT id INT UNSIGNED, IN _username VARCHAR(30), IN _email VARCHAR(320), IN _telephoneNumber VARCHAR(25), IN _name VARCHAR(30), IN _firstLastname VARCHAR(30), IN _secondLastname VARCHAR(30), IN _sex CHAR(1), IN _birthday DATE, IN _password VARCHAR(100), IN _country SMALLINT, IN _state VARCHAR(30), IN _city VARCHAR(30), IN _zip VARCHAR(10), IN _location VARCHAR(150))
BEGIN
	SET id = NULL;
    CALL validateString(_username);
    CALL validateString(_email);
    CALL validateString(_telephoneNumber);
    CALL validateString(_name);
    CALL validateString(_firstLastname);
    CALL validateString(_secondLastname);
    CALL validateString(_username);
    CALL validateString(_state);
    CALL validateString(_city);
    CALL validateString(_zip);
    CALL validateString(_location);
    INSERT INTO User(username, email, telephoneNumber, name, firstLastName, secondLastName, sex, birthday, password, country, state, city, zip, location) VALUE (_username, _email, _telephoneNumber, _name, _firstLastName, _secondLastName, UPPER(TRIM(_sex)), _birthday, SHA2(_password, 512), _country, _state, _city, _zip, _location);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateUser(IN id INT UNSIGNED, IN _username VARCHAR(30), IN _email VARCHAR(320), IN _telephoneNumber VARCHAR(25), IN _name VARCHAR(30), IN _firstLastname VARCHAR(30), IN _secondLastname VARCHAR(30), IN _sex CHAR(1), IN _birthday DATE, IN _country SMALLINT, IN _state VARCHAR(30), IN _city VARCHAR(30), IN _zip VARCHAR(10), IN _location VARCHAR(150))
BEGIN
    CALL validateString(_username);
    CALL validateString(_email);
    CALL validateString(_telephoneNumber);
    CALL validateString(_name);
    CALL validateString(_firstLastname);
    CALL validateString(_secondLastname);
    CALL validateString(_username);
    CALL validateString(_state);
    CALL validateString(_city);
    CALL validateString(_zip);
    CALL validateString(_location);
    UPDATE User SET username=_username, email=_email, telephoneNumber=_telephoneNumber, name=_name, firstLastName=_firstLastname, secondLastName=_secondLastname, sex=_sex, birthday=_birthday, country=_country, state=_state, city=_city, zip=_zip, location=_location, updateRow=NOW() WHERE identificator = id LIMIT 1;
	CALL selectUser(id);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deleteUser(IN id INT UNSIGNED)
BEGIN
    DELETE FROM User WHERE identificator = id LIMIT 1;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE disableUser(IN id INT UNSIGNED)
BEGIN
    UPDATE User SET status = 0, updateRow=NOW() WHERE identificator = id LIMIT 1;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE selectUser(IN id INT UNSIGNED)
BEGIN
	SELECT identificator, username, email, telephoneNumber, name, firstLastname, secondLastname, sex, birthday, country, state, city, zip, location FROM User WHERE identificator = id LIMIT 1;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE accessUser(INOUT id INT UNSIGNED, IN _username VARCHAR(30), IN _password VARCHAR(100))
BEGIN
	SET id = NULL;
    CALL validateString(_username);
    SELECT identificator INTO id FROM User WHERE status=1 AND username=_username AND password=SHA2(_password, 512) LIMIT 1;
    IF id IS NOT NULL THEN
		CALL selectUser(id);
        CALL selectLastTrasplantations(id);
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerPlant(OUT id INT UNSIGNED, IN _denomination VARCHAR(30), IN _description VARCHAR(150), IN _color VARCHAR(15), IN _age FLOAT, IN _kingdom VARCHAR(30), IN _phylum VARCHAR(30), IN _class VARCHAR(30), IN _orders VARCHAR(30), IN _family VARCHAR(30), IN _genus VARCHAR(30), IN _species VARCHAR(30), IN _country SMALLINT UNSIGNED, IN _exotic BIT)
BEGIN
	SET id = NULL;
    CALL validateString(_denomination);
    CALL validateString(_description);
    CALL validateString(_color);
    CALL validateString(_kingdom);
    CALL validateString(_phylum);
    CALL validateString(_class);
    CALL validateString(_orders);
    CALL validateString(_family);
    CALL validateString(_genus);
    CALL validateString(_species);
    INSERT INTO Plant(denomination, description, color, age, kingdom, phylum, class, orders, family, genus, species, country, exotic) VALUE (_denomination, _description, _color, _age, _kingdom, _phylum, _class, _orders, _family, _genus, _species, _country, _exotic);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerPotPlant(OUT id SMALLINT UNSIGNED, IN _code VARCHAR(30), IN _denomination VARCHAR(30), IN _version VARCHAR(10), IN _description VARCHAR(150), IN _properties VARCHAR(150), IN _material VARCHAR(30), IN _color VARCHAR(10), IN _texture VARCHAR(30))
BEGIN
	SET id = NULL;
    CALL validateString(_code);
    CALL validateString(_denomination);
    CALL validateString(_version);
    CALL validateString(_description);
    CALL validateString(_properties);
    CALL validateString(_material);
    CALL validateString(_color);
    CALL validateString(_texture);
    INSERT INTO PotPlant(code, denomination, version, description, properties, material, color, texture) VALUE (_code, _denomination, _version, _description, _properties, _material, _color, _texture);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerModule(OUT id TINYINT UNSIGNED, IN _code VARCHAR(30), IN _denomination VARCHAR(30), IN _brand VARCHAR(30), IN _model VARCHAR(30), IN _version VARCHAR(10), IN _description VARCHAR(150))
  BEGIN
	SET id = NULL;
    CALL validateString(_code);
    CALL validateString(_denomination);
    CALL validateString(_brand);
    CALL validateString(_model);
    CALL validateString(_version);
    CALL validateString(_description);
    INSERT INTO Module(code, denomination, brand, model, version, description) VALUE (_code, _denomination, _brand, _model, _version, _description);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerMeasurement(OUT id TINYINT UNSIGNED, IN _variable VARCHAR(30), IN _units VARCHAR(30))
BEGIN
	SET id = NULL;
    CALL validateString(_variable);
    CALL validateString(_units);
    INSERT INTO Measurement(variable, units) VALUE (_variable, _units);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerPotPlantUnit(OUT id BIGINT UNSIGNED, IN _code VARCHAR(30), IN _PotPlant_identificator SMALLINT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_code);
    INSERT INTO PotPlantUnit(code, PotPlant_identificator) VALUE (_code, _PotPlant_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE selectPotPlantUnit(OUT id BIGINT UNSIGNED, IN _code VARCHAR(30))
BEGIN
	SET id = NULL;
	SELECT identificator INTO id FROM PotPlantUnit WHERE code = _code LIMIT 1;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerGraphic(OUT id INT UNSIGNED, _graph TINYTEXT, _type SMALLINT, _Trasplantation_identificator BIGINT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_graph);
    INSERT INTO Graphic(graph, type, Trasplantation_identificator) VALUE (_graph, _type, _Trasplantation_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerAcquisition(OUT id BIGINT UNSIGNED, IN _PotPlantUnit_identificator BIGINT UNSIGNED, IN _User_identificator INT UNSIGNED)
  BEGIN
	SET id = NULL;
    INSERT INTO Acquisition(PotPlantUnit_identificator, User_identificator) VALUE (_PotPlantUnit_identificator, _User_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerPot(OUT id BIGINT UNSIGNED, IN _code VARCHAR(30), IN _User_identificator INT UNSIGNED, IN _name VARCHAR(30), IN _age FLOAT, IN _notes VARCHAR(150))
  BEGIN
	SET id = NULL;
    CALL validateString(_code);
    CALL validateString(_name);
    CALL validateString(_notes);
    SET @PotPlantUnit_identificator = NULL;
	CALL selectPotPlantUnit(@PotPlantUnit_identificator, _code);
    IF @PotPlantUnit_identificator IS NOT NULL THEN
		CALL registerAcquisition(id, @PotPlantUnit_identificator, _User_identificator);
        
        CALL registerTrasplantation(@Trasplantation_identificator, _name, _age, _notes, id, 1);
        
        CALL selectLastTrasplantations(_User_identificator);
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerImplementation(OUT id INT UNSIGNED, IN _properties VARCHAR(150), IN _PotPlant_identificator SMALLINT UNSIGNED, IN _Module_identificator TINYINT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_properties);
    INSERT INTO Implementation(properties, PotPlant_identificator, Module_identificator) VALUE (_properties, _PotPlant_identificator, _Module_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerMonitoring(OUT id BIGINT UNSIGNED, IN _notes VARCHAR(150), IN _Implementation_identificator INT UNSIGNED, IN _Measurement_identificator TINYINT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_notes);
    INSERT INTO Monitoring(notes, Implementation_identificator, Measurement_identificator) VALUE (_notes, _Implementation_identificator, _Measurement_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerTrasplantation(OUT id BIGINT UNSIGNED, IN _name VARCHAR(30), IN _age FLOAT, IN _notes VARCHAR(150), IN _Acquisition_identificator BIGINT UNSIGNED, IN _Plant_identificator INT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_name);
    CALL validateString(_notes);
    UPDATE Trasplantation SET status=0 AND updateRow=NOW() WHERE Acquisition_identificator=_Acquisition_identificator;
    INSERT INTO Trasplantation(name, age, notes, Acquisition_identificator, Plant_identificator) VALUE (_name, _age, _notes, _Acquisition_identificator, _Plant_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerObservation(OUT id BIGINT UNSIGNED, IN _value DOUBLE, IN _ipv4 VARCHAR(30), IN _notes VARCHAR(150), IN _Trasplantation_identificator BIGINT UNSIGNED, IN _Monitoring_identificator BIGINT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_notes);
    INSERT INTO Observation(value, ipv4, notes, Trasplantation_identificator, Monitoring_identificator) VALUE (_value, _ipv4, _notes, _Trasplantation_identificator, _Monitoring_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerStatus(OUT id BIGINT UNSIGNED, IN _code VARCHAR(30), IN _ipv4 VARCHAR(30), IN _temperature DOUBLE, IN _humidity DOUBLE, IN _surfaceHumidity DOUBLE, IN _brightness DOUBLE, IN _latitude DOUBLE, IN _longitude DOUBLE, IN _altitude DOUBLE)
  BEGIN
	SET id = NULL;
    SET @param = NULL;
    CALL selectLastTrasplantation(id, _code);
    IF id IS NOT NULL THEN
		CALL validateString(_ipv4);
		CALL registerObservation(@param, _temperature, _ipv4, NULL, id, 3);
        CALL registerObservation(@param, _humidity, _ipv4, NULL, id, 1);
        CALL registerObservation(@param, _surfaceHumidity, _ipv4, NULL, id, 5);
        CALL registerObservation(@param, _brightness, _ipv4, NULL, id, 7);
        CALL registerObservation(@param, _latitude, _ipv4, NULL, id, 9);
        CALL registerObservation(@param, _longitude, _ipv4, NULL, id, 10);
        CALL registerObservation(@param, _altitude, _ipv4, NULL, id, 11);
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE selectLastTrasplantation(OUT id BIGINT UNSIGNED, IN _code VARCHAR(30))
  BEGIN
	SET id = NULL;
    CALL validateString(_code);
    SELECT tra.identificator INTO id FROM PotPlantUnit AS ppu INNER JOIN Acquisition AS acq ON ppu.identificator = acq.PotPlantUnit_identificator INNER JOIN Trasplantation AS tra ON acq.identificator = tra.Acquisition_identificator WHERE ppu.code=_code AND tra.status=1 LIMIT 1;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerAttention(OUT id BIGINT UNSIGNED, IN _initialValue DOUBLE, IN _finalValue DOUBLE, IN _notes VARCHAR(150), IN _Plant_identificator INT UNSIGNED, IN _Measurement_identificator TINYINT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_notes);
    INSERT INTO Attention(initialValue, finalValue, notes, Plant_identificator, Measurement_identificator) VALUE (_initialValue, _finalValue, _notes, _Plant_identificator, _Measurement_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerPotPlantProfile(OUT id SMALLINT UNSIGNED, IN _value DOUBLE, IN _notes VARCHAR(150), IN _PotPlant_identificator SMALLINT UNSIGNED, IN _Measurement_identificator TINYINT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_notes);
    INSERT INTO PotPlantProfile(value, notes, PotPlant_identificator, Measurement_identificator) VALUE (_value, _notes, _PotPlant_identificator, _Measurement_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registerPlantProfile(OUT id INT UNSIGNED, IN _value DOUBLE, IN _notes VARCHAR(150), IN _Plant_identificator INT UNSIGNED, IN _Measurement_identificator TINYINT UNSIGNED)
  BEGIN
	SET id = NULL;
    CALL validateString(_notes);
    INSERT INTO PlantProfile(value, notes, Plant_identificator, Measurement_identificator) VALUE (_value, _notes, _Plant_identificator, _Measurement_identificator);
    SET id = @@identity;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE selectLastTrasplantations(IN _User_identificator INT UNSIGNED)
  BEGIN
    SELECT tra.identificator, tra.name, IFNULL(pla.species, '') AS "species", IF(tra.status=1, 1, 0) AS "status", pot.denomination FROM Acquisition AS acq INNER JOIN Trasplantation AS tra ON acq.identificator = tra.Acquisition_identificator LEFT JOIN Plant AS pla ON tra.Plant_identificator = pla.identificator INNER JOIN PotPlantUnit AS ppu ON acq.PotPlantUnit_identificator = ppu.identificator INNER JOIN PotPlant AS pot ON ppu.PotPlant_identificator = pot.identificator WHERE acq.User_identificator = _User_identificator AND pot.status = 1 AND ppu.status = 1 AND acq.status = 1 ORDER BY tra.register DESC;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE selectTrasplantation(IN _Trasplantation_identificator BIGINT UNSIGNED, IN _User_identificator INT UNSIGNED)
  BEGIN
    SELECT tra.identificator, tra.name, tra.age, tra.notes, tra.register, tra.updateRow, IFNULL(pla.denomination, '') AS "denomination", IFNULL(pla.description, '') AS "description", IFNULL(pla.color, "000000") AS "color", pla.age AS "agePlant", IFNULL(pla.kingdom, '') AS "kingdom", IFNULL(pla.phylum, '') AS "phylum", IFNULL(pla.class, '') AS "class", IFNULL(pla.orders, '') AS "orders", IFNULL(pla.family, '') AS "family", IFNULL(pla.genus, '') AS "genus", IFNULL(pla.species, '') AS "species", pla.country, IF(pla.exotic=1, 1, 0) AS "exotic", acq.register AS "registerAcquisition", ppu.code, pot.code AS "codePot", pot.denomination AS "denominationPot", pot.version, pot.description AS "descriptionPot", pot.properties, pot.material, IFNULL(pot.color, "000000") AS "colorPot", pot.texture, obs.ipv4 FROM Acquisition AS acq INNER JOIN Trasplantation AS tra ON acq.identificator = tra.Acquisition_identificator INNER JOIN Observation AS obs ON tra.identificator = obs.Trasplantation_identificator LEFT JOIN Plant AS pla ON tra.Plant_identificator = pla.identificator INNER JOIN PotPlantUnit AS ppu ON acq.PotPlantUnit_identificator = ppu.identificator INNER JOIN PotPlant AS pot ON ppu.PotPlant_identificator = pot.identificator WHERE acq.User_identificator = _User_identificator AND tra.identificator = _Trasplantation_identificator AND pot.status = 1 AND ppu.status = 1 AND acq.status = 1 ORDER BY obs.register DESC LIMIT 1;
    SELECT graph FROM graphic WHERE Trasplantation_identificator = _Trasplantation_identificator ORDER BY type ASC;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE validateString(INOUT string VARCHAR(150))
BEGIN
	SET string = TRIM(string);
    IF LENGTH(string) = 0 THEN
		SET string = NULL;
    END IF;
END//
DELIMITER ;
