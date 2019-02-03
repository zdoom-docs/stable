# CVar

A **C**onsole **Var**iable, either defined in `CVARINFO` or by the engine.
**Not serializable. Do not use as a member unless marked as `transient`.**

All Get and Set operations will work regardless of the real type of the CVar,
as they aren't "strongly" typed.

```
struct CVar
{
   static CVar FindCVar(name n);
   static CVar GetCVar(name n, PlayerInfo player = null);

   bool   GetBool();
   double GetFloat();
   int    GetInt();
   string GetString();

   void SetBool(bool v);
   void SetFloat(double v);
   void SetInt(int v);
   void SetString(string v);

   int GetRealType();
   int ResetToDefault();
}
```

- `FindCVar`

   Returns a server CVar by name, or `null` if none is found.

- `GetCVar`

   Returns a user or server CVar by name, with `player` as the user if
   applicable, or `null` if none is found.

- `GetBool`

   Returns a boolean representing the value of the CVar, or `false` if it
   cannot be represented.

- `GetFloat`

   Returns a float representing the value of the CVar, or `0.0` if it cannot be
   represented.

- `GetInt`

   Returns an integer representing the value of the CVar, or `0` if it cannot
   be represented.

- `GetString`

   Returns a string representing the value of the CVar. CVars can always be
   represented as strings.

- `SetBool`
- `SetFloat`
- `SetInt`
- `SetString`

   Sets the representation of the CVar to `v`. May only be used on mod-defined
   CVars.

- `GetRealType`

   Returns the type of the CVar as it was defined, which may be one of the
   following:

   | Name               |
   | ----               |
   | `CVar.CVAR_Bool`   |
   | `CVar.CVAR_Color`  |
   | `CVar.CVAR_Float`  |
   | `CVar.CVAR_Int`    |
   | `CVar.CVAR_String` |

- `ResetToDefault`

   Resets the CVar to its default value and returns 0. The purpose of the
   return is unknown. May only be used on mod-defined CVars.

<!-- EOF -->
