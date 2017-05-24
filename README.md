# Lambda Genetic Programming Trader

This is a genetic programming trader based on the work done in the paper _Discovering Financial Technical Trading Rules Using Genetic Programming With Lambda Abstraction_ (Yu, 2005).

## Representing Lambdas

So, similar to the work I did in the [numerai genetic program](https://github.com/Shalmezad/numerai-gp-rails), I want to store the programs in a database so they're easily accessible. Since the lambdas use a tree-like structure as opposed to the stack/postfix-like structure, a way to represent these trees needs to be devised. Luckily, it shouldn't be too hard with JSON. 

So, let's take one of the examples given in the paper:
    if-then-else(index>min(6),true,false)

Which can be represented by the tree:
```
if-then-else
|
|->
| |-index
| |-min
|   |-6
|-true
|-false
```

So with json:
```
{
  "if-then-else": [{
      ">":[
        "index",
        {"min":6}
      ]
    },
    "true",
    "false"
  ]
}
```
Or more concisely:
```
{"if-then-else":[{">":["index",{"min":6}]},"true","false"]}
```





