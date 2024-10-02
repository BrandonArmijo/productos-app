import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { environment } from '../../environments/environment.development';
import { ProductosDetalles } from './productos-detalles.model';
import { NgForm } from '@angular/forms';

@Injectable({
  providedIn: 'root'
})
export class ProductosDetallesService {

  url:string = environment.apiBaseUrl + '/ProductoDetalle'
  list:ProductosDetalles[] = [];
  formData : ProductosDetalles = new ProductosDetalles();
  formSubmitted: boolean = false;
  constructor(private http: HttpClient) { }

  refreshList(){
    this.http.get(this.url)
    .subscribe({
      next: res => {
        this.list=res as ProductosDetalles[]
      },
      error: err => { console.log(err); }
    })
  }

  postAgregarProducto(){
    return this.http.post(this.url,this.formData)
  }

  putActualizarProducto(){
    return this.http.put(this.url + '/' + this.formData.productoId, this.formData)
  }

  resetForm(form:NgForm){
    form.form.reset();
    this.formData = new ProductosDetalles()
    this.formSubmitted = false;
  }

}
