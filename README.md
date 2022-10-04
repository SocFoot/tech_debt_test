## Access To The Application

Can we make the application run in a terminal without specifying the use of ruby? Can we pass arguments to the application?


Yes.

`bin/parse.rb webserver.log`


## Validations And Exceptions

Are there any validations and errors that need to be raised/handled?

 You can check beforehand if the file exists.

Code comprehension

How easy will it be for other devs to understand the code and work on it? If OOP is applied, are there any principles from 

SOLID that can be applied? Are there any architectural patterns that can be applied?                       

It would be quite easy, hopefully.  The single responsibility principle, the classes are designed with one purpose in mind.

Dependency injection hash is used as an abstraction to communicate between the LogPrinter and LogProcessor. 



## Performance

Are there any wins we can have to make the provided code scalable?

We can multithread the work done by the parser.

## DRY

 Are there areas we can encapsulate and reuse?

I created multiple classes and methods that are reused. I believe this state is good enough.

## Testing

What testing strategy can we go for to protect the feature from breaking if other features are added to the code later on.

We can use TDD with cucumber for example to protect the main scenarios.

## Code Format

 Are there any tools we can use to keep the code clean and consistent? (no need to code this, let’s discuss)  

I used simple cov and rubocop and git.