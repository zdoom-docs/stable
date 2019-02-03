# Class Handling

TODO

```
Type GetDefaultByType(class<Actor> type);
Type New(class typename = ThisClass);
```

- `GetDefaultByType`

   Returns an object containing the default values for each member of the
   `Actor` type provided as they would be set in `BeginPlay`. **Note that the
   return value cannot be serialized and if stored must be marked as
   `transient`.** The returned object is a pseudo-object which is stored only
   in-memory.

- `New`

   Typically spelled lowercase (`new`), creates an object with type `typename`.
   Defaults to using the class of the calling object.

<!-- EOF -->
