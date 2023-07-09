import { Component } from '@angular/core';

@Component({
  selector: 'app-blog-header',
  templateUrl: './blog-header.component.html',
  styleUrls: ['./blog-header.component.css'],
})
export class BlogHeaderComponent {
  
  today = new Date();
  formattedDate = this.formatDate(this.today);

  //Function to convert Date to mm/dd/yyyy
  formatDate(date: Date): string {
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const year = date.getFullYear().toString();
    return `${month}/${day}/${year}`;
  }
}
