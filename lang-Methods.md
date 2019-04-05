# Method Definitions

<!-- vim-markdown-toc GFM -->

* [Method Argument List](#method-argument-list)
   * [Example: Method argument lists](#example-method-argument-lists)
* [Method Definition Flags](#method-definition-flags)
   * [Action functions](#action-functions)

<!-- vim-markdown-toc -->

Method definitions define functions within a structure or class that can be
accessed directly within other methods of the object (or its derived classes,)
or indirectly from instances of it with the member access operator.

Methods marked as `virtual` may have their functionality overridden by derived
classes, and in those overrides one can use the `Super` keyword to call the
parent function.

Methods are formed as so:

```
$[Method-definition-flags...]$ Type $[ , Type]$... Identifier ( $[Method-argument-list]$ ) $[ const ]$
{
   $[Statement...]$
}
```

If `const` is placed after the function signature and before the function body,
the method will not be allowed to modify any members in the object instance
it's being called on.

The keyword `void` can be used in place of the return type (or type list) to
have a method which does not have any return value. Similarly, one can place
`void` where the argument list might be, although this is redundant as having
no argument list at all is allowed.

Arguments of methods may only be of certain types due to technical limitations.
See the type table for a list of which are usable and which are not.

All methods which are not `static` have an implicit `self` parameter which
refers to this object, although if you wish to refer to a member of `self`, you
do not need to reference it directly, as it is already implicitly in scope.

# Method Argument List

Method arguments must all have a name and type, and optionally the last
arguments in the list may have a default value, (*Version 3.3.0 and newer*)
except in functions marked `override`. The syntax is:

```
Type Variable-name $[ , Method-argument-list]$
Type Variable-name = Expression $[ , Method-argument-list]$
```

Or, the entire list may simply be `void` or empty.

## Example: Method argument lists

```
// With the function:
void DoSomething(int one, int two, int a = 0, int b = 0);

// One could do the following:
DoSomething(4, 5);
DoSomething(5, 6, 7);
DoSomething(6, 7, 8, 9);

// Or using named default arguments,
DoSomething(5, 6, a: 7);

// Equivalent to:
DoSomething(5, 6, 7);

// And more examples:
DoSomething(6, 7, b: 8);
DoSomething(7, 8, a: 9, b: 10);
DoSomething(7, 8, 9, 10);
```

# Method Definition Flags

| Flag                   | Description                                                                                    |
| ----                   | -----------                                                                                    |
| `action ( Scope )`     | Same as `action`, but has a specified action scope. See "Action Scoping" for more information. |
| `action`               | Method has implicit `invoker` and `stateinfo` parameters. See below for more info.             |
| `clearscope`           | Method has Data scope.                                                                         |
| `deprecated ( "ver" )` | If accessed, a script warning will occur on load if the archive version is greater than `ver`. |
| `final`                | Virtual method cannot be further overridden from derived classes.                              |
| `native`               | Method is from the engine. Only usable internally.                                             |
| `override`             | Method is overriding a base class' virtual method.                                             |
| `play`                 | Method has Play scope.                                                                         |
| `private`              | Method is not visible to any class but this one.                                               |
| `protected`            | Method is not visible to any class but this one and any descendants of it.                     |
| `static`               | Function is not a method, but a global function without a `self` pointer.                      |
| `ui`                   | Method has UI scope.                                                                           |
| `vararg`               | Method doesn't type-check arguments after `...`. Only usable internally.                       |
| `version ( "ver" )`    | Restricted to ZScript version `ver` or higher.                                                 |
| `virtual`              | Method can be overridden in derived classes.                                                   |
| `virtualscope`         | Method has scope of the type of the object it's being called on.                               |

## Action functions

ZScript includes an extra method type for descendents of `Actor` called
*actions*, which are intended to be run from actor states and give extra
information to the function. Action functions change the meaning of the `self`
parameter and pass in `invoker` and `stateinfo` parameters as well. `stateinfo`
refers to the `State` which this action was called from. Here is a chart for
the meanings of the `self` and `invoker` variables under each scope:

| Scope     | `self` meaning                                                  | `invoker` meaning |
| -----     | --------------                                                  | ----------------- |
| None      | The actor this function operates on, ambiguous in some contexts | State owner       |
| `actor`   | The actor                                                       | The actor         |
| `item`    | Item owner                                                      | Item itself       |
| `overlay` | Weapon owner                                                    | Weapon itself     |
| `weapon`  | Weapon owner                                                    | Weapon itself     |

<!-- EOF -->
