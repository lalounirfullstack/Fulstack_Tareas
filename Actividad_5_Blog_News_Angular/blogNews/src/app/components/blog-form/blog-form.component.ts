import { Component, EventEmitter, Output } from '@angular/core';
import { Blog } from 'src/app/interfaces/blog.interface';

@Component({
  selector: 'app-blog-form',
  templateUrl: './blog-form.component.html',
  styleUrls: ['./blog-form.component.css'],
})
export class BlogFormComponent {
  @Output() blogEntryEmitido: EventEmitter<Blog>;
  newBlogEntry: Blog = { title: '', image: '', news: '', date: '' };

  constructor() {
    this.blogEntryEmitido = new EventEmitter();
  }

  getDataForm() {
    this.blogEntryEmitido.emit(this.newBlogEntry);
    //Clear Values
    this.newBlogEntry = { title: '', image: '', news: '', date: '' };
  }
}
