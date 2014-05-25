## Energy Monitor

I wanted to make a project with as much hype as possible. Hold your horses this project features: An Arduino, a Raspberry Pi, a Rails API and client with server push through Faye, responsive layout using Bootstrap and an iOS mobile app. I wanted to use Node.js and put a map in there but I ran out of time. For the next time.

The idea was to prototype as fast as I could a proof of concept of an Internet connected device. I chose to do an energy monitor. The idea is pretty simple: I have a thingy at home that consumes energy, I want to send how much energy consumes to a central webapp through an API. This API will be consumed by the iOS app and I will also have a responsive web version.

![Poster](https://raw.githubusercontent.com/marcelinollano/energy-monitor/master/Assets/Poster.jpg)

The project has many moving parts. I know it will be hard to replicate everything exactly the same, but I hope some parts could help you build your own system. The truth is I scrapped most of its parts from Internet and hack it together. You can do something similar any day, I am sure.

### Hardware Setup

The hardware part could be simpler to be fair. If you have an Arduino with a [Wi-Fi shield](http://arduino.cc/en/Main/ArduinoWiFiShield) you can skip the Raspberry Pi altogether. I find the Arduino Uno and the 512MB Raspberry Pi to be the best to have around. They both are very well supported, have a huge community behind and are very flexible. Anyway, here are the components:

![Materials](https://raw.githubusercontent.com/marcelinollano/energy-monitor/master/Assets/Materials.jpg)

You do not need the case for the RPi or the Wi-Fi dongle. I do not have my Internet router close to me so I connected the RPi to the home network and then the Arduino through USB to the RPi. If I need to upload software to the Arduino I just plug it to my laptop and then to the RPi again. You could do this directly through SSH, though.

The labels "5v Cable" and "Ground Cable" are there just to point out how to wire it. I took the schematics from the [Arduino website](http://arduino.cc/en/tutorial/button):

![Wiring](https://raw.githubusercontent.com/marcelinollano/energy-monitor/master/Assets/Wiring.png)

Our energy monitor will be a lamp AKA a led. We will use a push button to toggle the lamp on and after toggling it off we will send the milliseconds to the RPi and from there to the webapp. The code to make the push button work is in the `Sensor` folder. Wire it up and upload the code. Moving on!

### Software Setup

Here is a quick demo demo of the end result:

![Gifcast](https://raw.githubusercontent.com/marcelinollano/energy-monitor/master/Assets/Gifcast.gif)

![Materials](https://raw.githubusercontent.com/marcelinollano/energy-monitor/master/Assets/Materials.jpg)

![Apps](https://raw.githubusercontent.com/marcelinollano/energy-monitor/master/Assets/Apps.jpg)

### Conclusions

### Sources

http://josephleehoffman.com/ios-development
http://arduino.cc/en/tutorial/button
