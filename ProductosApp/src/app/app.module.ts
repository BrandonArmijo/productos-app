import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProductosDetallesComponent } from './productos-detalles/productos-detalles.component';
import { ProductosDetallesFormComponent } from './productos-detalles/productos-detalles-form/productos-detalles-form.component';
import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';
import { NgxPaginationModule } from 'ngx-pagination';

@NgModule({
  declarations: [
    AppComponent,
    ProductosDetallesComponent,
    ProductosDetallesFormComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    BrowserAnimationsModule, 
    ToastrModule.forRoot(),
    NgxPaginationModule
  ],
  providers: [],  
  bootstrap: [AppComponent]
})
export class AppModule { }
