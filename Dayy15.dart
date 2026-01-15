enum Priority 
{
  critical,
  normal,
  low
}

class Patient 
{
  final String name;
  final Priority priority;

  Patient(this.name, this.priority);
}

class HospitalQueue 
{
  final List<Patient> _queue = [];

  void addPatient(Patient patient) 
{
    if (patient.priority == Priority.critical) 
    {
      _queue.insert(0, patient);
    } else if (patient.priority == Priority.normal) 
    {
      int index = _queue.lastIndexWhere(
        (p) => p.priority == Priority.critical
      );
      _queue.insert(index + 1, patient);
    } else 
    {
      _queue.add(patient);
    }
  }

  Patient? attendNext() 
  {
    if (_queue.isEmpty) return null;
    return _queue.removeAt(0);
  }

  void printQueue() 
  {
    for (var p in _queue) 
    {
      print("${p.name} - ${p.priority.name}");
    }
  }
}

void main() {
  HospitalQueue queue = HospitalQueue();

  queue.addPatient(Patient("Kwame", Priority.normal));
  queue.addPatient(Patient("Akosua", Priority.critical));
  queue.addPatient(Patient("Yaw", Priority.low));
  queue.addPatient(Patient("Ama", Priority.normal));

  print("Current Queue:");
  queue.printQueue();

  Patient? next = queue.attendNext();
  if (next != null) 
  {
    print("\nAttending: ${next.name}");
  }

  print("\nQueue After Attendance:");
  queue.printQueue();
}
