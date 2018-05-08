# Listing 51a: Remember, rescue can accept any class or module object. Now that we have extended the original exceptions with the error tag module, 
# the expression evaluates to true, so the outer sescue intercepts the exception.

AcmeHttp::Error === error