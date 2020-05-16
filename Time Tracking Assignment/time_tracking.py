"""
  Time tracking for Nana
"""
import sys,time,random,csv
from datetime import datetime
def timeTracker():
  slow_type("Welcome to Time tracking program \n")
  slow_type("To record your start time, please type 'start now'.\n")
  slow_type("Type 'end now' to record your time after completing your task\n")
  start = input("Start time \n")
  startTime = datetime.now()
  endTime = datetime.now()
  hourlyrate = 5
  if start.lower() == "start now":
    startTime = datetime.now()
    print("You started at " + str(startTime))
  else:
    print("Please type 'start now' to start timing.")

  end = input("End time \n")
  if end.lower() == "end now":
    endTime = datetime.now()
    print("You ended at " + str(endTime))
  else:
    print("Please type 'end now' to stop timing.")

  timeTaken = endTime - startTime
  timeInsec = timeTaken.total_seconds()
  timeInhours = timeInsec/3600
  print("You worked for " + str(timeTaken))
  print("You worked for " + str(timeInsec) + " seconds")
  print("You worked for " + str(timeInhours) + " hours")

  fees = timeInhours * hourlyrate
  slow_type("Please charge client $" + str(round(fees, 2)))


  with open('task.csv', 'w') as csvfile:
    fieldnames = ['Start Time', 'End Time', 'Fee']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerow({'Start Time': startTime, 'End Time': endTime, 'Fee': fees})



typing_speed = 150 #wpm
def slow_type(t):
    for l in t:
        sys.stdout.write(l)
        sys.stdout.flush()
        time.sleep(random.random()*10.0/typing_speed)
    print ('')



if __name__ == '__main__':
  timeTracker()