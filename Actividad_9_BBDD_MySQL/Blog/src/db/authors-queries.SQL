/***************************************
              > AUTHORS <
 ***************************************/
/*All Authors*/
SELECT * FROM blogs.authors;

/*Author By ID*/
SELECT * FROM blogs.authors WHERE id=13;

/*Authors with Posts*/
SELECT a.*,
       p.*
FROM blogs.authors a
JOIN blogs.posts p ON a.id=p.authors_id;

/*Update Author*/
UPDATE blogs.authors
SET name='Edgar Roe',
    email='eroe@yahoo.com'
WHERE id= 4;

/*Delete Author*/
DELETE FROM blogs.authors
WHERE id=11;



