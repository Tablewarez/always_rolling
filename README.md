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
Dice.roll('3d100dh') # => [57, 14, 88] # => [57, 14] # => 71
Dice.roll('3d100dh2') # => [57, 14, 88] # => 14
```

Or dropping the lowest dice result

```
Dice.roll('3d100dl') # => [57, 14, 88] # => [57, 88] # => 145
Dice.roll('3d100dl2') # => [57, 14, 88] # => 88
```
