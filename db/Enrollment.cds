namespace db;

using { cuid } from '@sap/cds/common';


entity Mentor : cuid{
    Name    : String(40) @mandatory;
    EmailId : String(40) @assert.format : '[a-zA-Z0-9]+[a-zA-Z0-9.%\-\+]*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]';
    PhoneNo : String(10) @assert.format:'[0-9]';
}

entity Course : cuid{
    Title       : String(60) @mandatory @assert.unique;
    Description : String(100);
    StartDate   : Date @assert.range:['2000-01-01','2030-01-01'];
    EndDate     : Date;
    Trainees    : Composition of many Trainee on Trainees.course = $self;
}
entity Trainee : cuid{
    Name    : String(40);
    Age     : Integer @assert.range: [18, 30];
    EmailId : String(40);
    course  : Association to Course;
    mentor : Association to Mentor;
}