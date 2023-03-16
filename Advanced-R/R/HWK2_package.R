
library(devtools)
library(rlang)
sqrt.2 = function(x){
  if (x < 0){
    rlang::abort(message = "negative input, NA introduced!")
  } else {
    return(sqrt(x))
  }
}

log.2 = function(x){
  if (x <= 0){
    rlang::abort(message = "negative input, NA introduced!")
  } else {
    return(log(x))
  }
}

f_operator = function(f){
  force(f)
  function(x) {
    if (x>0) {
      f(x)
    } else {
      catch_cnd(abort(.subclass = "invalid_input",
                      message = "negative input, NA introduced!",
                      invalid_input=x))
    }
  }
}


sqrt.3 = f_operator(sqrt.2)
log.3 = f_operator(log.2)