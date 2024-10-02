import { Component } from '@angular/core';
import { ProductosDetallesService } from '../../shared/productos-detalles.service';
import { NgForm } from "@angular/forms";
import { ProductosDetalles } from '../../shared/productos-detalles.model';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-productos-detalles-form',
  templateUrl: './productos-detalles-form.component.html',
  styles: ``
})
export class ProductosDetallesFormComponent {

  constructor(public service : ProductosDetallesService, private toastr:ToastrService){
  }

  onSubmit(form:NgForm){
    this.service.formSubmitted = true
    if(form.valid){
      if(this.service.formData.productoId == 0)
        this.insertRecord(form)
      else
      this.updateRecord(form)
    }
    
  }

  insertRecord(form:NgForm){
    this.service.postAgregarProducto()
    .subscribe({
      next: res => {
        this.service.list = res as ProductosDetalles[]
        this.service.resetForm(form)
        this.toastr.success('Producto agregado correctamente','Gestión de Productos')
      },
      error: err => { console.log(err); }
      
    })
  }

  updateRecord(form:NgForm){
    this.service.putActualizarProducto()
    .subscribe({
      next: res => {
        this.service.list = res as ProductosDetalles[]
        this.service.resetForm(form)
        this.toastr.info('Producto actualizado correctamente','Gestión de Productos')
      },
      error: err => { console.log(err); }
      
    })
  }




}
