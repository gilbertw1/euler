class EulerExtensions {
  static def addExtensions() {
    Number.metaClass.factors = {m=2->
      if([1,2].contains(delegate)) {
        return []
      }
      
      if(delegate % m == 0) {
        return [m] + (delegate.intdiv(m)).factors(m)
      } else if(Math.sqrt(delegate) <= m) {
        [delegate]
      } else {
        factors(m+1)
      }
    }

    Number.metaClass.primeSieve = {->
      vals = [0..delegate]
      vals[0..1] = [null,null]

      Math.sqrt(delegate).floor().times() {val ->
        if(!vals[val]) {
          return
        }

        (val^2).step(delegate,val) {mult->
          vals[mult] = null
        }
      }
      vals
    }

    Number.metaClass.primesTo {->
      primeSieve.findAll() {x->x}
    }

    Number.metaClass.isPrime {->
      factors().first() == delegate
    }
  }
}