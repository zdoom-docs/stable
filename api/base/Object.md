# Object

The base class of all `class` types.

```
class Object
{
   bool bDestroyed;

   class  GetClass();
   string GetClassName();
   class  GetParentClass();

   virtualscope void Destroy();

   virtual virtualscope void OnDestroy();
}
```

### `bDestroyed`

This object wants to be destroyed but has not yet been garbage collected.

### `GetClass`

Returns the class type of this object.

### `GetClassName`

Returns a string representation of the class type of this object.

### `GetParentClass`

Returns the class type of this object's parent class.

### `Destroy`

Destroys this object. Do not use the object after calling this. References to
it will be invalidated.

### `OnDestroy`

Called just before the object is collected by the garbage collector. **Not
deterministic** unless the object is linked into the thinker list, in which
case it is destroyed earlier in a deterministic setting. Not all `Thinker`s are
linked into this list, so be careful when overriding this. Any `Actor` will
generally be safe.

<!-- EOF -->
