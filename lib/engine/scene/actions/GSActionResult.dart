enum EActionStatus {
  DISPATCHED,
  SKIPPED,
}

class GSActionResult {
  GSActionResult({required this.status, this.isInterrupt = false, this.launchNextRecursive = false});

  EActionStatus status;
  bool isInterrupt;
  bool launchNextRecursive;
}