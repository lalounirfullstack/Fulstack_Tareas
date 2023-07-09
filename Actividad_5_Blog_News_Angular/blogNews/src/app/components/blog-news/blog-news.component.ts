import { Component, Input } from '@angular/core';
import { Blog } from 'src/app/interfaces/blog.interface';

@Component({
  selector: 'app-blog-news',
  templateUrl: './blog-news.component.html',
  styleUrls: ['./blog-news.component.css'],
})
export class BlogNewsComponent {
  @Input() blogNews: Blog[] = [];

  loadBlogNews() {
    let html = '';
    console.log(this.blogNews);
    //Loops through Blog News arrays and builds HTML
    this.blogNews.forEach((blogEntry) => {
      html += `<article class="blog-entry">
                <div class="card-image">
                  <figure>
                  <img src="${blogEntry.image}" alt="${blogEntry.title}" width="300" height="300">
                  </figure>
                </div>
                <div class="card content">
                  <div class="media-content">
                    <p class="title is-6">${blogEntry.date}</p>
                    <p class="title is-4">${blogEntry.title}</p>
                </div>
                <div class="content">
                  <p>${blogEntry.news}</p>
                </div>
                <div>
                  <p>More...</p>
                </div>
              </article>`;
    });
    return html;
  }
}
