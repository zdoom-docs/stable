# System

TODO

```
uint MSTime();
vararg void ThrowAbortException(string format, ...);
```

- `MSTime`

   Returns the number of milliseconds since the engine was started. **Not deterministic.**

- `ThrowAbortException`

   Kills the VM and ends the game (without exiting) with a formatted error.

<!-- EOF -->
