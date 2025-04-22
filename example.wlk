object cacho {
  var formaDePago = uala
  
  method puedeComprar(algo) = formaDePago.montoDisponible() >= algo.total(
    self.formaDePago()
  )
  
  method cambiarformaDePago(otraForma) {
    formaDePago = otraForma
  }
  
  method formaDePago() = formaDePago
  
  method comprar(algo) = if (self.puedeComprar(algo))
                           formaDePago.montoDisponible() - algo.total(
                             self.formaDePago()
                           )
}

object leche {
  var precio = 1000
  
  method precio() = 1000
  
  method total(algo) = self.precio() * algo.descuento()
}

object cereza {
  var peso = 300 //gramos
  const precioCada100 = 1000
  
  method precio() = (peso / 100) * precioCada100
  
  method cambiarPeso(cantidad) {
    peso = cantidad
  }
} ////////////////////////////////////////////////////////

object verano {
  var verano = true
  var aumento = 2
  
  method cambiarEstacion() {
    verano = false
    aumento = 5
  }
  
  method aumento() = aumento
  
  method esVerano() = verano
}

object sandia {
  var peso = 1000 //gramos
  var precio = verano.aumento()
  
  method precio() = verano.aumento()
  
  method mostrarPeso() = peso
  
  method total(algo) = (peso * verano.aumento()) * algo.descuento()
  
  method cambiarPeso(cantidad) {
    peso = cantidad
  }
}

object uala {
  var monto = 1500
  const descuento = 0.8
  
  method descuento() = descuento
  
  method montoDisponible() = monto
} ///////////////////////////////////////////////

object efectivo {
  const monto = 10000
  const descuento = 1
  
  method descuento() = descuento
  
  method montoDisponible() = monto
  
  method gastadoHastaAhora() = 0
}

object tarjetaDeCredito {
  const limite = 5
  var estaActiva = true
  const descuento = 1.5
  
  method descuento() = descuento
  
  method montoDisponible() = if (estaActiva) limite - self.gastadoHastaAhora()
                             else 0
  
  method gastadoHastaAhora() = 98000
  
  method activar() {
    estaActiva = true
  }
  
  method desactivar() {
    estaActiva = false
  }
}