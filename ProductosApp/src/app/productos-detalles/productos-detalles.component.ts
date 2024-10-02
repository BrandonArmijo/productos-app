import { Component, OnInit } from '@angular/core';
import { ProductosDetallesService } from '../shared/productos-detalles.service';
import { ProductosDetalles } from '../shared/productos-detalles.model';
import { ToastrService } from 'ngx-toastr'; 

@Component({
  selector: 'app-productos-detalles',
  templateUrl: './productos-detalles.component.html',
  styles: ``
})
export class ProductosDetallesComponent implements OnInit{

  public page!: number;

  constructor(public service : ProductosDetallesService, private toastr:ToastrService){
  }

  ngOnInit(): void {
    this.service.refreshList();
  }

  populateForm(selectedRecord:ProductosDetalles){
    this.service.formData = Object.assign({},selectedRecord);
  }

  

}
