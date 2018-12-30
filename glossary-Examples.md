# Examples

<!-- vim-markdown-toc GFM -->

* [Class headers](#class-headers)
* [Class definitions](#class-definitions)
* [Property definitions](#property-definitions)
* [Flag definitions](#flag-definitions)
* [Structure definitions](#structure-definitions)
* [Enumeration definitions](#enumeration-definitions)
* [Constant definitions](#constant-definitions)
* [Include directives](#include-directives)
* [Function argument lists](#function-argument-lists)
* [Expression statements](#expression-statements)
* [Conditional statements](#conditional-statements)
* [Switch statements](#switch-statements)
* [Control flow statements](#control-flow-statements)
* [Multi-assignment statements](#multi-assignment-statements)
* [Member declarations](#member-declarations)

<!-- vim-markdown-toc -->

Code examples for ZScript demonstrating various features.

## Class headers

Various class headers.

```
class MyCoolObject // automatically inherits Object
class MyCoolScopedObject play // has Play scope
class MyCoolThinker : Thinker // inherits Thinker
class MyCoolActor : Actor replaces OtherActor
class MyCoolInterface abstract // can only be inherited
```

## Class definitions

Basic class definition with a member variable and member function.

```
class BasicClass
{
   int m_Thing;

   void ChangeThing()
   {
      m_Thing = 500;
   }
}
```

Alternate syntax usage.

```
class TheWholeFileIsAClassOhNo;

int m_MyMember;

// end of file
```

## Property definitions

A class with some properties.

```
class MyCoolActor : Actor
{
   default
   {
      MyCoolActor.MyCoolMember 5000;
      MyCoolActor.MyCoolMemberList 501, 502;
   }

   int m_MyCoolMember;
   int m_CoolMember1, m_CoolMember2;

   property MyCoolMember: m_MyCoolMember;
   property MyCoolMemberList: m_CoolMember1, m_CoolMember2;
}
```

## Flag definitions

A class with some flags.

```
class MyCoolActorWithFlags : Actor
{
   default
   {
      +MYCOOLACTORWITHFLAGS.THIS_ONE_IS_ON
      -MYCOOLACTORWITHFLAGS.THIS_ONE_IS_OFF
   }

   int m_Flags;

   flagdef This_One_Is_On: m_Flags, 0;
   flagdef This_One_Is_Off: m_Flags, 1;
   flagdef This_One_Aliases_On: m_Flags, 0;

   bool CheckIfOnIsOn()
   {
      return bTHIS_ONE_IS_ON;
   }
}
```

## Structure definitions

Simple structure.

```
struct MyCoolStructure
{
   int X;
   int Y;
   int Z;
}
```

## Enumeration definitions

Basic enumeration.

```
enum MyCoolEnum
{
   A, // has value int(0)
   B, // 1 ...
   C, // 2 ...
   D  // and 3
}
```

Less trivial example.

```
enum MyCoolerEnum : int16
{
   A = 500, // has value int16(500)
   B, // 501
   C = 200,
   D, // 201
   E, // 202
};
```

## Constant definitions

Making an integer constant from a double.

```
const MY_COOL_INT = int(777.7777);
```

## Include directives

Basic includes.

```
#include "zscript/MyCoolMod/MyCoolClasses.zsc"
```

## Function argument lists

With the function:

```
void Fn(int one, int two, int a = 0, int b = 0);
```

One could do the following:

```
Fn(4, 5);
Fn(5, 6, 7);
Fn(6, 7, 8, 9);
```

Or using named default arguments,

```
Fn(5, 6, a: 7);
Fn(6, 7, b: 8);
Fn(7, 8, a: 9, b: 10);

// equivalent to:
Fn(5, 6, 7);
// (no equivalent, must use above)
Fn(7, 8, 9, 10);
```

## Expression statements

Some basic expressions.

```
MyCoolFunction(5, 4);
m_MyCoolMember = 500;
5 * 5; // does nothing of course, but valid
```

## Conditional statements

Simple conditional.

```
if(a)
   B();
```

Simple conditional, with else statement and a block.

```
if(a)
{
   B();
   c = d;
}
else
   e = f;
```

## Switch statements

A switch demonstrating fall-through and default cases.

```
switch(a)
{
case 500: Console.Printf("a is 500"); break;
case 501: Console.Printf("a is 501"); // falls through to next case
case 502: Console.Printf("a is 501 or 502"); break;
default:
   Console.Printf("not sure what a is!");
   // break is implied here
}
```

## Control flow statements

Use of `continue`.

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) continue; // don't do anything on 25!

   DoThing(i);
}
```

Use of `break`.

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) break; // exit the loop at 25!

   DoThing(i);
}
```

Use of `return` in various contexts.

```
void ReturnsNothing()
{
   if(m_Thing != 50) return; // exit early if m_Thing isn't 50.

   DoThing(m_Thing);
}

int ReturnsInt()
{
   if(m_Thing == 50)
      return 50; // m_thing is 50, so return 50.

   return 0; // must have a return eventually
}

int, int ReturnsTwoInts()
{
   return 1, 2; // returns 1 and 2.
}
```

## Multi-assignment statements

Getting the actor out of `A_SpawnItemEx`.

```
Actor mo;
bool spawned;
[spawned, mo] = A_SpawnItemEx("MyCoolActor");
```

## Member declarations

Some basic member variables.

```
int m_MyCoolInt;
int m_CoolInt1, m_CoolInt2, m_CoolInt3;
int[10] m_CoolIntArray;
private int m_CoolPrivateInt;
protected meta int m_CoolMetaInt;
```

<!-- EOF -->
