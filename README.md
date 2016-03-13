# dice

A ruby dice roller

```
require 'dice'
Dice.roll('1d100') # => 57
```

You can also add static modifiers

```
Dice.roll('1d100+5') # => 57+5 # => 62
```

And you can modify the dice rolls them selves by dropping the highest dice result

```
Dice.roll('2d100dh') # => [57, 14] # => 14
```

Or dropping the lowest dice result

```
Dice.roll('2d100dl') # => [57, 14] # => 57
```
