Statements
==========

<!-- vim-markdown-toc GFM -->

* [Compound Statements](#compound-statements)
* [Expression Statements](#expression-statements)
   * [Example: Expression statements](#example-expression-statements)
* [Conditional Statements](#conditional-statements)
   * [Example: Conditional statements](#example-conditional-statements)
* [Switch Statements](#switch-statements)
   * [Example: Switch statements](#example-switch-statements)
* [Loop Statements](#loop-statements)
* [Control Flow Statements](#control-flow-statements)
   * [Example: Control flow statements](#example-control-flow-statements)
* [Local Variable Statements](#local-variable-statements)
* [Multi-assignment Statements](#multi-assignment-statements)
   * [Example: Multi-assignment statements](#example-multi-assignment-statements)
* [Static Array Statements](#static-array-statements)
* [Null Statements](#null-statements)

<!-- vim-markdown-toc -->

All functions are made up of a list of *statements* enclosed with left and
right braces, which in and of itself is a statement called a *compound
statement*, or *block*.

Compound Statements
===================

A compound statement is formed as:

```
{
   $[Statement...]$
}
```

Note that the statement list is optional, so an empty compound statement `{}`
is entirely valid.

Expression Statements
=====================

An expression statement is the single most common type of statement in just
about any programming language. In ZScript, exactly like C and C++, an
expression statement is simply formed with any expression followed by a
semicolon. Function calls and variable assignments are expressions, for
instance, so it is quite clear why they are common.

Their syntax is:

```
Expression ;
```

## Example: Expression statements

Some basic expressions.

```
MyCoolFunction(5, 4);
m_MyCoolMember = 500;
5 * 5; // does nothing of course, but valid
```

Conditional Statements
======================

A conditional statement will, conditionally, choose a statement (or none) to
execute. They work the same as in C and ACS:

```
if ( Expression ) Statement $[ else Statement]$
```

## Example: Conditional statements

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

Switch Statements
=================

A switch statement takes an expression of integer or name type and selects a
labeled statement to run. They work the same as in C and ACS:

```
switch ( Expression ) Statement
```

## Example: Switch statements

A switch demonstrating fall-through and default cases.

```
switch(a)
{
case 500: Console.PrintF("a is 500"); break;
case 501: Console.PrintF("a is 501"); // falls through to next case
case 502: Console.PrintF("a is 501 or 502"); break;
default:
   Console.PrintF("not sure what a is!");
   // break is implied here
}
```

Loop Statements
===============

ZScript has five loop statements, `for`, `while`, `until`, `do while` and `do
until`. `for`, `while` and `do while` work the same as in C, C++ and ACS, while
`until` and `do until` do the inverse of `while` and `do while`.

The `for` loop takes a limited statement and two optional expressions: The
statement for when the loop begins (which is scoped to the loop,) one
expression for checking if the loop should break, and one which is executed
every time the loop iterates. Its syntax is:

```
for ( $[Expression-or-Local-variable-statement]$ ; $[Expression]$ ; $[Expression]$ ) Statement
```

The `while` loop simply takes one expression for checking if the loop should
break, equivalent to `for(; a;)`.

The `until` loop is equivalent to `while(!a)`. Their syntax are:

```
while ( Expression ) Statement
until ( Expression ) Statement
```

`do while` and `do until` will only check the expression after the first
iteration is complete. The `do while` and `do until` loops are formed as such:

```
do
   Statement
while ( Expression ) // unlike C, you don't need a semicolon here

do
   Statement
until ( Expression )
```

Control Flow Statements
=======================

As in C, there are three control flow statements that manipulate where the
program will execute statements next, which are available contextually. They
are `continue`, `break` and `return`.

`continue` is available in loop statements and will continue to the next
iteration immediately:

```
continue ;
```

`break` is available in loop statements and switch statements, and will break
out of the containing statement early:

```
break ;
```

`return` is available in functions. If the function does not return any values,
it may only be spelled `return;` and will simply exit the function early. If
the function does return values, it takes a comma-separated list for each value
returned:

```
return $[Expression $[ , Expression]$...]$ ;
```

## Example: Control flow statements

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

Local Variable Statements
=========================

Local variable statements are formed in one of 2 ways. The `let` keyword can be
used to automatically determine the type of the variable from the initializer,
while the regular syntax uses an explicit type, and initialization is optional.

Variables' syntax are one of:

```
Variable-name
Variable-name = Expression
```

And local variable statements have the syntax of either:

```
let Identifier = Expression ;
Type Variable $[ , Variable]$... ;
```

Multi-assignment Statements
===========================

Expressions or functions that return multiple values can be assigned into
multiple variables with the syntax:

```
[ Expression $[ , Expression]$... ] = Expression ;
```

Note that the surrounding brackets are literal and not an optional element.

## Example: Multi-assignment statements

Getting the actor out of `A_SpawnItemEx`.

```
Actor mo;
bool spawned;
[spawned, mo] = A_SpawnItemEx("MyCoolActor");
```

Static Array Statements
=======================

Static arrays can be defined normally as a statement.

Null Statements
===============

A null statement does nothing, and is formed `;`. It is similar to an empty
compound statement.

<!-- EOF -->
