def all_questions()
    run_sql("SELECT * FROM questions;")
end

def create_question(title, body, votes, user_id)
    sql_query = "INSERT INTO questions (title, body, votes, user_id) VALUES ($1, $2, $3, $4);"; 
    params = [title, body, votes, user_id]
    run_sql(sql_query, params)
end

def question_id(id)
    run_sql("SELECT * FROM questions WHERE id=$1", [id])
end

def question_update(id, title, body)
    params = [id, title, body]
    run_sql("UPDATE questions SET title = $2, body = $3 WHERE id= $1", params)
end

def delete_question(id)
    run_sql("DELETE FROM questions WHERE id = $1", [id])
end
