# Examples

* [Class headers](#class-headers)
* [Class definitions](#class-definitions)
* [Property definitions](#property-definitions)
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
   int m_thing;

   void changeThing()
   {
      m_thing = 500;
   }
}
```

Alternate syntax usage.

```
class TheWholeFileIsAClassOhNo;

int m_mymember;

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

   int m_myCoolMember;
   int m_coolMember1, m_coolMember2;

   property MyCoolMember: m_myCoolMember;
   property MyCoolMemberList: m_coolMember1, m_coolMember2;
}
```

## Structure definitions

Simple structure.

```
struct MyCoolStructure
{
   int x;
   int y;
   int z;
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
const MyCoolInt = int(777.7777);
```

## Include directives

Basic includes.

```
#include "zscript/MyCoolMod/MyCoolClasses.zsc"
```

## Function argument lists

With the function:

```
void fn(int one, int two, int a = 0, int b = 0);
```

One could do the following:

```
fn(4, 5);
fn(5, 6, 7);
fn(6, 7, 8, 9);
```

Or using named default arguments,

```
fn(5, 6, a: 7);
fn(6, 7, b: 8);
fn(7, 8, a: 9, b: 10);

// equivalent to:
fn(5, 6, 7);
// (no equivalent, must use above)
fn(7, 8, 9, 10);
```

## Expression statements

Some basic expressions.

```
myCoolFunction(5, 4);
m_myCoolMember = 500;
5 * 5; // does nothing of course, but valid
```

## Conditional statements

Simple conditional.

```
if(a)
   b();
```

Simple conditional, with else statement and a block.

```
if(a)
{
   b();
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

   doThing(i);
}
```

Use of `break`.

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) break; // exit the loop at 25!

   doThing(i);
}
```

Use of `return` in various contexts.

```
void returnsNothing()
{
   if(m_thing != 50) return; // exit early if m_thing isn't 50.

   doThing(m_thing);
}

int returnsInt()
{
   if(m_thing == 50)
      return 50; // m_thing is 50, so return 50.

   return 0; // must have a return eventually
}

int, int returnsTwoInts()
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
int m_myCoolInt;
int m_coolInt1, m_coolInt2, m_coolInt3;
int[10] m_coolIntArray;
private int m_coolPrivateInt;
protected meta int m_coolMetaInt;
```

<!-- EOF -->
