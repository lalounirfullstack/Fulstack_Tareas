//Librerias
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

//Components
import { AppComponent } from './app.component';
import { BlogHeaderComponent } from './components/blog-header/blog-header.component';
import { BlogFormComponent } from './components/blog-form/blog-form.component';
import { BlogNewsComponent } from './components/blog-news/blog-news.component';
import { BlogFooterComponent } from './components/blog-footer/blog-footer.component';

@NgModule({
  declarations: [
    AppComponent,
    BlogHeaderComponent,
    BlogFormComponent,
    BlogNewsComponent,
    BlogFooterComponent,
  ],
  imports: [BrowserModule, FormsModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
