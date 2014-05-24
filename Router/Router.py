import serial, time, os

output = serial.Serial('/dev/ttyACM0', 9600)
start = 0;
end = 0;

while 1:
  line = output.readline()
  line = line.strip()
  line = int(line)

  if (line == 0) and (start != 0):
    end = time.time()
    elapsed = end - start
    cmd = "curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X PUT http://192.168.0.12:3000/things/1 -d '{\"thing\":{\"time\": \"" + str(elapsed) + "\"}}'"
    os.system(cmd)
    print
    print str(elapsed)

  if line is 1:
    start = time.time()