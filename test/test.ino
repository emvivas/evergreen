#include <Arduino.h>
#include "DHT.h"
#define DHTTYPE DHT11 // DHT 11
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

const char *WIFI_SSID = "kiosko";
const char *WIFI_PASSWORD = "12345678910a";
const char *URL = "http://192.168.43.104:8090/registerObservation";

int DHTPin = D3; // Pin D4 en el MCU
int sense_Pin = A0; // Pin de entrada del sensor A0
int value = 0;
int sensorBomba = D5; // D5
DHT dht(DHTPin, DHTTYPE);

WiFiClient client;
HTTPClient httpClient;

float Temperatura() {
    float Temperature = dht.readTemperature();
    Serial.println(Temperature);
    return (Temperature);
}

float Humedad() {
  float Humidity = dht.readHumidity();
  Serial.println(Humidity);
  return (Humidity);
}

int HumedadTierra() {
  //Humedad de la Tierra
 
  int hum = analogRead(sense_Pin);
  int humEart = hum / 10;
  Serial.println(humEart);
  return (humEart);
}

int Luz() {
  //Luz
  int value = analogRead(A0);
  Serial.println(value);
  return (value);
}

/*void AguaActiva() {
  HTTPClient http;
  if (http.begin(wifiClient, "")) {  //path de la tabla de registros del agua 
    Serial.println("[HTTP] Calling");
    int httpcode = http.GET();
    if (httpcode > 0) {
      String activo = http.getString();                       //Get the response to the request
      Serial.println("AGUAAA");
      Serial.println(httpcode);   //Print return code
      Serial.println(activo);           //Print request answer
      if (activo == "des") {
        //Apaga la bomba
        digitalWrite(sensorBomba, LOW);
        Serial.println("Apagando");
      } else {
        //Enciende la bomba
        digitalWrite(sensorBomba, HIGH);
        Serial.println("Prendiendo");
      }
    }
    else {
      Serial.print("Error on sending POST: ");
      Serial.println(httpcode);
    }
    
    http.end();
  } else {
    Serial.printf("[HTTP Error] Unable to connect\n");
  }
}
*/
void setup()
{
    Serial.begin(115200);
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }

    Serial.println("Connected");
    delay(1500);
    pinMode(DHTPin, INPUT);
    pinMode(sensorBomba, OUTPUT);
    dht.begin(); //Iniciamos el sensor
}

void loop()
{
    String data = "code=ExpoTECIoT2022&temperature="+String(Temperatura())+"&humidity="+String(Humedad())+"&surfaceHumidity="+String(HumedadTierra())+"&brightness="+String(Luz())+"&latitude=30&longitude=20&altitude=10";

    httpClient.begin(client, URL);
    httpClient.addHeader("Content-Type", "application/x-www-form-urlencoded");
    httpClient.POST(data);
    String content = httpClient.getString();
    httpClient.end();

    Serial.println(content);
    delay(10000);
}














/*
#include "DHT.h"
#define DHTTYPE DHT11 // DHT 11
#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>

int DHTPin = D4; // Pin D4 en el MCU

const char* ssid = "Totalplay-4A9F";
const char* password = "4A9F7A297A6zU66a";
WiFiClient client;

String codigo = "ExpoTECIoT2022";

int sense_Pin = A0; // Pin de entrada del sensor A0
int value = 0;
int sensorBomba = D5; // D5
DHT dht(DHTPin, DHTTYPE);


char* api_url = "http://192.168.100.150:8090/registerObservation";

WiFiClient wifiClient;

//------------------------------------------ Network WIFI ------------------------------------------
void connectToWiFi() {
  //Connect to WiFi Network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to WiFi");
  Serial.println("...");
  WiFi.begin(ssid, password);
  int retries = 0;
  while ((WiFi.status() != WL_CONNECTED) && (retries < 15)){
    retries++;
    delay(500);
    Serial.print(".");
  }
  if (retries > 14) {
    Serial.println(F("WiFi connection FAILED"));
  }
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println(F("WiFi connected!"));
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
  }
  Serial.println(F("Setup ready"));
}


// ---------------------------------------- SETUP ----------------------------------------
void setup() {
  Serial.begin(115200);
  delay(1500);
  pinMode(DHTPin, INPUT);
  pinMode(sensorBomba, OUTPUT);
  connectToWiFi();
  dht.begin(); //Iniciamos el sensor
}

float Temperatura() {
    float Temperature = dht.readTemperature();
    Serial.println(Temperature);
    return (Temperature);
}

float Humedad() {
  float Humidity = dht.readHumidity();
  Serial.println(Humidity);
  return (Humidity);
}

int HumedadTierra() {
  //Humedad de la Tierra
 
  int hum = analogRead(sense_Pin);
  int humEart = hum / 10;
  Serial.println(humEart);
  return (humEart);
}

int Luz() {
  //Luz
  int value = analogRead(A0);
  Serial.println(value);
  return (value);
}

void Envio(float Temperatura,float Humedad,int HumedadTierra,int Luz){
  HTTPClient http;
  if (http.begin(wifiClient, api_url)) {
    Serial.println("[HTTP] Calling");
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");
    //String bodyPOSTUno = "?code:"+ codigo +"&temperature="+Temperatura+"&humidity="+ Humedad +"&surfaceHumidity="+ HumedadTierra +"&brightness=" + Luz +"&latitude=78&longitude=45&altitude=89";
    String bodyPOSTUno = "code=ExpoTECIoT2022&temperature=14.3&humidity=52.4&surfaceHumidity=45&brightness=1000&latitude=78&longitude=45&altitude=89";
    Serial.println(bodyPOSTUno);
    int httpcode = http.POST(bodyPOSTUno);
    if (httpcode > 0) {
      String response = http.getString();                       //Get the response to the request
      Serial.println(httpcode);   //Print return code
      Serial.println(response);           //Print request answer
    } else {
      Serial.print("Error on sending POST: ");
      Serial.println(httpcode);
    }
    delay(1000);
    Serial.println();
    http.end();
  }
  else {
    Serial.printf("[HTTP Error] Unable to connect\n");
  }
}


// ---------------------------------------- LOOP ---------------------------------------
void loop() {
  //delay(10000);
  delay(2500);
  Envio(Temperatura(),Humedad(),HumedadTierra(),Luz());
  delay(2500);
  AguaActiva();
}
*/
