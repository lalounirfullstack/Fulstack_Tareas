const getAllPosts = () =>{
    return db.query('SELECT * FROM posts');
}

 const selectPostByAuthorId = (authorId) =>{
    return db.query('SELECT * FROM posts WHERE id = ?', [authorId])
 }

const insertPost = ({title, description, category, authors_id})=>{
    return db.query(
        'INSERT INTO posts (title, description, category, authors_id) values(?,?,?,?)', [title, description, category, authors_id] )
}

const updatePostById = (id, {title, description, category, updated_date, authors_id }) => {
    return db.query('UPDATE posts SET title=IFNULL(?,title), description=IFNULL(?,description),category=IFNULL(?,category),updated_date=?, authors_id=IFNULL(?,authors_id)  WHERE id=?',
    [title, description, category,updated_date, authors_id, id])
}

const deletePostById = (id) => {
    return db.query('DELETE FROM posts WHERE id=?', [id])
}

module.exports = {getAllPosts, selectPostByAuthorId, insertPost, updatePostById, deletePostById }