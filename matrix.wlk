object nave {

    const pasajeros = #{neo , morfeo , trinity}

    method cantidadDePasajeros() {
        return
            pasajeros.size()
    }

    method pasajeroDeMayorVitalidad() {
      return
        pasajeros.max({p=>p.vitalidad()})
    }

    method estaEquilibrado() {
        return
            not pasajeros.any({p=>p.vitalidad()*2 < self.pasajeroDeMayorVitalidad().vitalidad()})
    }

    method estaElElegido() {
        return
            pasajeros.any({p=>p.esElElegido()})
    }

    method chocar() {
        pasajeros.forEach({p=>p.saltar()})
        pasajeros.clear()
    }

    method acelerar() {
        pasajeros.filter({p=> not p.esElElegido()}).forEach({p=>p.saltar()})
        pasajeros.remove(neo)
    }
  
}

object neo {

  var energia = 100

  method esElElegido() = true

  method energia()   = energia

  method vitalidad() = energia/10

  method saltar() {
    energia = energia / 2
  }
}

object trinity {

    method esElElegido() = false

    method vitalidad() {
        return 0
    }

    method saltar() {}
  
}

object morfeo{

    method esElElegido() = false

    var vitalidad = 8

    var estaCansado = false

    method estaCansado() = estaCansado

    method vitalidad() = vitalidad

    method saltar() {
        estaCansado = not estaCansado
        vitalidad = vitalidad - 1
    }

}