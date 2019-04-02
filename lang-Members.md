# Member Declarations

<!-- vim-markdown-toc GFM -->

   * [Example: Member declarations](#example-member-declarations)
* [Member Declaration Flags](#member-declaration-flags)

<!-- vim-markdown-toc -->

Member declarations define data within a structure or class that can be
accessed directly within methods of the object (or its derived classes,) or
indirectly from instances of it with the member access operator.

A member declaration is formed as so:

```
$[Member-declaration-flags...]$ Type Variable-name $[ , Variable-name]$... ;
```

## Example: Member declarations

Some basic member variables.

```
int m_MyCoolInt;
int m_CoolInt1, m_CoolInt2, m_CoolInt3;
int[10] m_CoolIntArray;
private int m_CoolPrivateInt;
protected meta int m_CoolMetaInt;
```

# Member Declaration Flags

| Flag                   | Description                                                                                                         |
| ----                   | -----------                                                                                                         |
| `deprecated ( "ver" )` | If accessed, a script warning will occur on load if the archive version is greater than `ver`.                      |
| `internal`             | Member is only writable from the base resource archive (`gzdoom.pk3`.) *Version 3.4.0 and newer.*                   |
| `latent`               | Does nothing. Purpose unknown.                                                                                      |
| `meta`                 | Member is read-only static class data. Only really useful on actors, since these can be set via properties on them. |
| `native`               | Member is from the engine. Only usable internally.                                                                  |
| `play`                 | Member has Play scope.                                                                                              |
| `private`              | Member is not visible to any class but this one.                                                                    |
| `protected`            | Member is not visible to any class but this one and any descendants of it.                                          |
| `readonly`             | Member is not writable.                                                                                             |
| `transient`            | Member is not saved into save games. Required for unserializable objects and recommended for UI context objects.    |
| `ui`                   | Member has UI scope.                                                                                                |
| `version ( "ver" )`    | Restricted to ZScript version `ver` or higher.                                                                      |

<!-- EOF -->
