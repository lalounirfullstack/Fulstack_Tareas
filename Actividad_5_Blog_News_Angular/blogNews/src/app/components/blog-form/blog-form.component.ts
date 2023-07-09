import { Component, EventEmitter, Output } from '@angular/core';
import { Blog } from 'src/app/interfaces/blog.interface';

@Component({
  selector: 'app-blog-form',
  templateUrl: './blog-form.component.html',
  styleUrls: ['./blog-form.component.css'],
})
export class BlogFormComponent {
  //Send Information from Child to Parent
  @Output() blogEntryEmitido: EventEmitter<Blog>;
  newBlogEntry: Blog = { title: '', image: '', news: '', date: '' };

  constructor() {
    this.blogEntryEmitido = new EventEmitter();
  }

  getDataForm() {
    //Send information from the Blog Form to the Parent
    this.blogEntryEmitido.emit(this.newBlogEntry);
    //Clear Form Values
    this.newBlogEntry = { title: '', image: '', news: '', date: '' };
  }
}
