# Prefix negation

Logical negation (`!`) applies to the complete following method chain, call,
or index expression, before comparisons and binary logical operators:

```ruby
children = [1]
!children.nothing?       # true, equivalent to !(children.nothing?)
!children.nothing? && false # false

children = nothing
!children.nothing?       # false
```

Use `(!children).nothing?` to call a method on the negated receiver explicitly.
The low-precedence `not` keyword and numeric prefixes (`+`, `-`, `~`) retain
their existing behavior, including `-1.abs` evaluating to `1`.
