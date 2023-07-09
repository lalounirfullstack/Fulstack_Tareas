import { Component } from '@angular/core';
import { Blog } from './interfaces/blog.interface';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  //Array of News.
  blogNews: Blog[] = [];

  //Use to include dynamic Date on the Hard coded Blog Entry.
  today = new Date();
  formattedDate = this.formatDate(this.today);

  //Initializes Blog with 2 Blogs.
  constructor() {
    this.blogNews = [
      {
        title: 'Angular Update Coming!',
        image:
          'https://images.pexels.com/photos/4164418/pexels-photo-4164418.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        news: 'Angular is about to release a new version that will impressed the developers around the world ... !',
        date: this.formattedDate,
      },
      {
        title: 'Developer is a rewarding path !',
        image:
          'https://images.pexels.com/photos/1181263/pexels-photo-1181263.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        news: 'Despite its complexity, and challenges, coding is an excelent choice ... !',
        date: this.formattedDate,
      },
    ];
  }

  //Function to convert Date to mm/dd/yyyy
  formatDate(date: Date): string {
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const year = date.getFullYear().toString();
    return `${month}/${day}/${year}`;
  }

  //Gets Data from the form and adds to the array
  getBlogEntry($event: Blog) {
    if (!$event.title || !$event.image || !$event.news || !$event.date) {
      alert('Title, Image, News, and Date are required fields');
    } else {
      this.blogNews.push($event);
    }
  }
}
