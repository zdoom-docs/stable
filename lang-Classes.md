# Class Definitions

<!-- vim-markdown-toc GFM -->

	* [Example: Class headers](#example-class-headers)
	* [Example: Class definitions](#example-class-definitions)
* [Class Flags](#class-flags)
* [Class Content](#class-content)
* [Property Definitions](#property-definitions)
	* [Example: Property definitions](#example-property-definitions)
* [Flag Definitions](#flag-definitions)
	* [Example: Flag definitions](#example-flag-definitions)
* [Default Blocks](#default-blocks)
	* [Default Flag](#default-flag)
	* [Default Property](#default-property)
* [State Definitions](#state-definitions)

<!-- vim-markdown-toc -->

A class defines an object type within ZScript, and is most of what you'll be
creating within the language.

All classes inherit from other classes. The base class can be set within the
class header, but if it is not the class will automatically inherit from
`Object`.

Classes are subject to Scoping. They are also implicitly reference values, and
therefore can be null. Use `new` to instantiate a new class object.

Classes that inherit from Actor can replace other actors when spawned in maps,
and can also be used freely in `DECORATE`. Actors have states, which will not
be explained in this document as they are already well-documented on the ZDoom
wiki.

A class is formed with the syntax:

```
class Identifier $[ : Base-class]$ $[Class-flags...]$
{
   $[Class-content...]$
}
```

`Base-class` in this context is an `Identifier`.

Alternatively, the rest of the file can be used as class content. Note that
with this syntax you cannot use include directives afterward:

```
class Identifier $[ : Base-class]$ $[Class-flags...]$ ;

$[Class-content...]$
```

If the class is defined within the same archive as the current file, then one
can continue a class definition with the syntax:

```
extend class Identifier
```

In place of the class header.

## Example: Class headers

```
// Automatically inherits Object, similar to the "actor" keyword in DECORATE.
class MyCoolObject
{
}

// Equivalent to the above.
class MyCoolObjectExplicit : Object
{
}

// Has "Play" scope.
class MyCoolScopedObject play
{
}

// Inherits Thinker and can override functions on it.
class MyCoolThinker : Thinker
{
}

// Some actor.
class OtherActor : Actor
{
}

// Replaces "OtherActor."
class MyCoolActor : Actor replaces OtherActor
{
}

// Can only be inherited.
class MyCoolInterface abstract
{
}
```

## Example: Class definitions

Basic class definition with a member variable and member function.

```
class BasicClass
{
   // "m_Thing" is attached to any "instance" of BasicClass.
   int m_Thing;

   // Changes "m_Thing" to 500 on an instance of BasicClass.
   void ChangeThing()
   {
      m_Thing = 500;
   }
}
```

Alternate syntax usage.

```
// This class spans from this point to the end of the file.
class TheWholeFileIsAClassOhNo;

int m_MyMember;

// End of file, end of class.
```

# Class Flags

| Flag                     | Description                                                                       |
| ----                     | -----------                                                                       |
| `abstract`               | Cannot be instantiated with `new`.                                                |
| `native`                 | Class is from the engine. Only usable internally.                                 |
| `play`                   | Class has Play scope.                                                             |
| `replaces Replace-class` | Replaces `Replace-class` with this class. Only works with descendants of `Actor`. |
| `ui`                     | Class has UI scope.                                                               |
| `version ( "ver" )`      | Restricted to ZScript version `ver` or higher.                                    |

`Replace-class` in this context is an `Identifier` denoting a class which
inherits `Actor`.

# Class Content

Class contents are an optional list of various things logically contained
within the class, including:

- Member declarations
- Method definitions
- Property definitions
- Flag definitions
- Default blocks
- State definitions
- Enumeration definitions
- Structure definitions
- Constant definitions
- Static array definitions

# Property Definitions

Property definitions are used within classes to define defaultable attributes
on actors. They are not valid on classes not derived from Actor.

When registered, a property will be available in the `default` block as
`ClassName.PropertyName`. Properties can be given multiple members to
initialize.

Property definitions take the form:

```
property Identifier : Member $[ , Member]$... ;
```

Where `Member` is an identifier naming any member in the current class.

Properties defined in ZScript are usable from `DECORATE`.

## Example: Property definitions

A class with some properties.

```
class MyCoolActor : Actor
{
   // You can set defined properties in a "default" block like in DECORATE.
   // This will also be available in DECORATE code that inherits your class!
   default
   {
      MyCoolActor.MyCoolMember 5000;
      MyCoolActor.MyCoolMemberList 501, 502;
   }

   // Declare some members.
   int m_MyCoolMember;
   int m_CoolMember1, m_CoolMember2;

   // Declare some properties attached to our members.
   property MyCoolMember: m_MyCoolMember;
   property MyCoolMemberList: m_CoolMember1, m_CoolMember2;
}
```

# Flag Definitions

*Version 3.7.0 and newer.*

Flag definitions are used within classes to define defaultable boolean flags on
actors. They are not valid on classes not derived from Actor.

When registered, a flag will be available in the `default` block as
`ClassName.FlagName`, as well as a member as `bFlagName`.

Each flag operates on a singular bit of any integer member of the class. The
integer must be exactly 32 bits, though if it is signed or not does not matter.
This means each backing integer can hold exactly 32 flags each (assuming no
duplicated flags,) and more will require another one to be added. (Internally,
the `Actor` flags are currently up to over 8 backing integers.)

A flag's backing integer may not be `meta`, although it may be `readonly`,
`private`, or any other access modifier. The generated flag member will be
publicly visible regardless of the backing integer's visibility.

Flag definitions take the form:

```
flagdef Identifier : Member , Number ;
```

Where `Number` is the bit in `Member` to use, starting from `0` and ending at
`31`.

Flags defined in ZScript are usable from `DECORATE`.

## Example: Flag definitions

A class with some flags.

```
class MyCoolActorWithFlags : Actor
{
   // You can set defined flag in a "default" block like in DECORATE.
   // This will also be available in DECORATE code that inherits your class!
   // Hey, those sentences sounded familiar...
   default
   {
      +MyCoolActorWithFlags.ThisOneIsOn
      -MyCoolActorWithFlags.ThisOneIsOff
   }

   // Declare a flag field for all of the flags. This can hold up to 32 flags.
   int m_Flags;

   // Declare the flags, one at a time...
   flagdef ThisOneIsOn: m_Flags, 0;
   flagdef ThisOneIsOff: m_Flags, 1;
   flagdef ThisOneAliasesOn: m_Flags, 0;

   // Unnecessary, since you can just access it directly, but this demonstrates
   // how declared flags can be used in methods.
   bool CheckIfOnIsOn()
   {
      return bThisOneIsOn;
   }
}
```

# Default Blocks

Default blocks are used on classes derived from Actor to create an overridable
list of defaults to properties, allowing for swift creation of flexible actor
types.

In `DECORATE`, this is everything that isn't in the `states` block, but in
ZScript, for syntax flexibility purposes, it must be enclosed in a block with
`default` at the beginning, formed:

```
default
{
   $[Default-statement...]$
}
```

Default statements include either flags or properties:

## Default Flag

Default flags are formed either:

```
+ Identifier $[ ; ]$
- Identifier $[ ; ]$
```

The former will enable the flag on this actor, the latter will disable it.

## Default Property

Default properties are formed as:

```
Identifier $[ . Identifier]$ $[Expression]$ ;
```

Note that all properties *except for* `DamageFunction` require `Expression` to
be a constant expression.

There are several special properties which add pre-defined flag sets onto the
actor. Here is a list of them:

| Name         | Description |
| ----         | ----------- |
| `ClearFlags` | Clears all flags except `ARGSDEFINED`. |
| `Monster`    | Adds the flags `SHOOTABLE COUNTKILL SOLID PUSHWALL MCROSS PASSMOBJ ISMONSTER CANUSEWALLS`. |
| `Projectile` | Adds the flags `NOBLOCKMAP NOGRAVITY DROPOFF MISSILE IMPACT PCROSS NOTELEPORT`, and if the game is Heretic or Hexen, `BLOODSPLATTER`. |

Note that like any other property, they require a semicolon after them,
although they do not use an expression.

# State Definitions

These are the same as `DECORATE`, but states that do not have function blocks
require terminating semicolons. Double quotes around `#` and `-` are no longer
required. State blocks can be subject to Action Scoping with the syntax
`states(Scope)`.

A state definition block has the syntax:

```
states $[ ( Scope $[ , Scope]$... ) ]$
{
   $[State-or-label...]$
}
```

State-or-label either defines a state label or a state itself, with the syntax:

```
Identifier :
Char{4} Char... Number-or-random $[State-option...]$ State-func
```

Where `Char` is any ASCII character, `Number-or-random` is one of:

```
Number
random ( Number , Number )
```

`State-option` is one of:

```
bright
fast
slow
nodelay
canraise
offset ( Number , Number )
light ( String $[ , String]$... )
```

And finally, `State-func` is one of:

```
;
Identifier ( Argument-list ) ;
{ $[Statement...]$ }
```

The first will attach no action function to the state. The second will attach
the specified action function with the specified arguments, and the third will
create an anonymous action function and attach it.

<!-- EOF -->
