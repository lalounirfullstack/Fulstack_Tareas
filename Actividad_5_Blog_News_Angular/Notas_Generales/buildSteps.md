## ##Design

Understand Requirements
Build Blog News mockup

## ##Project Build

1.Create Activity Folder
2.Create Blog News Project.
Inside Activity Folder
command: ng new blogNews --skip-tests
3.Launch Server
command: ng serve -o

---

##Interfaz Build
Inside blogNews
command: ng g i interfaces/blog --type=interface
Modify Interface to include:
title: string;
image: string;
news: string;
date: string;

---

##Create Components
command:
ng g c components/blog-header --skip-tests
ng g c components/blog-form --skip-tests
ng g c components/blog-news --skip-tests
ng g c components/blog-footer --skip-tests

Add Components to app.component.html

## ##Create Blog Array using Insterface

Update app-component.ts
add blogNews array referencing Interface
Initialize constructor with 2
Blog News matching interface requirements.

---

Update app.component.html to import blog news
blog news passed from Parent to Child
<app-blog-news [blogNews]="blogNews"></app-blog-news>

---

Update blog-news components
blog-news.html
Add innerHTML with Function:

## <div [innerHTML]="loadBlogNews()"></div>

Update blog-news ts
Add @input Array
Add loadBlogNews function
forEach to loop through the Array and display 'HTML' in blog-news-component.html

---

Output
Two-way Data binding
Add FormsModule in app.module.ts (Imports)

--
Update blog-form.hmtml
Create HTML structure with Input fields
Date is dynamically added so no need to add in the form.
Add function to the button. (click)="getDataForm()"

--
Update blog-form.ts
Add function getDataForm();
create a intance of newBlogEntry with Blog Type
initialize the new Instance
newBlogEntry: Blog = { title: '', image: '', news: '', date: '' };
--
Update blog-form.hmtml for two way Data Binding
Add [(ngModel)=newBlogEntry.element] to each element

--Output (children to Parent)
Add Output to send this info to Parent using EventEmitter<Blog>
Initialize EventEmitter in the constructor : this.blogEntryEmitido = new EventEmitter();
Pass newBlogEntry as a parameter of the emit method. this.blogEntryEmitido.emit(this.newBlogEntry);

--Update HTML of app.component.html
Add personalize Event in the blog-form:
<app-blog-form (blogEntryEmitido)="getBlogEntry($event)"></app-blog-form>
