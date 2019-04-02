# ReplaceEvent

The information for a `CheckReplacement` event. You can mutate the variables in
this event to change the result of replacement checking.

```
struct ReplaceEvent
{
   readonly class<Actor> Replacee;
   class<Actor>          Replacement;
   bool                  IsFinal;
}
```

- `Replacee`

   The actor class which is being replaced.

- `Replacement`

   What to replace it with. This class type is already effected by skill and
   actor definition replacements, so it may be useful to read it. Modify this
   to change what the resulting replacement class ends up being.

- `IsFinal`

   If `true`, the engine will not attempt to continue going down the
   replacement chain, and will directly replace the actor with `Replacement`.

<!-- EOF -->
