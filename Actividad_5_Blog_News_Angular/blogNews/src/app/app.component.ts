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
        news: 'Angular is about to release a new version that will impressed the developers around the world ... ! It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
        date: this.formattedDate,
      },
      {
        title: 'Developer is a rewarding path !',
        image:
          'https://images.pexels.com/photos/1181263/pexels-photo-1181263.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        news: 'Despite its complexity, and challenges, coding is an excelent choice ... ! Bacon ipsum dolor amet pastrami chuck flank buffalo chicken. Rump picanha turducken hamburger beef, tenderloin venison meatball bacon tail pork turkey. Beef ribs jowl flank pancetta venison chuck. Tongue jerky jowl beef ribs cow strip steak sirloin frankfurter pork belly pork loin. Chuck flank beef ribs strip steak, boudin ball tip jerky. Landjaeger venison tongue, jerky alcatra hamburger ribeye tri-tip flank. Flank shoulder shankle swine pastrami landjaeger bresaola doner t-bone sirloin buffalo.',
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
    //Validates that all the fields are provided to allow form Submission.
    if (!$event.title || !$event.image || !$event.news || !$event.date) {
      alert(
        ' ! Title, Image, News, and Date are required fields. Please fill up the fields !'
      );
    } else {
      //Adds a new Entry to the Blog News Arrays.
      this.blogNews.push($event);
    }
  }
}
